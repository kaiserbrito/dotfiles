#!/usr/bin/env bash
#
# Fresh macOS -> working machine.
#
#   curl -fsSL https://raw.githubusercontent.com/kaiserbrito/dotfiles/main/bootstrap.sh | bash
#
# Idempotent, so re-running is safe. Needs attending twice: the Xcode CLT
# installer, and sudo/chsh for the login shell. README.md lists what this
# deliberately leaves to you — keys, work git config, Accessibility grants.

set -euo pipefail

REPO_HTTPS="https://github.com/kaiserbrito/dotfiles.git"
REPO_SSH="git@github.com:kaiserbrito/dotfiles.git"
CONFIG_DIR="$HOME/.config"
BREW_PREFIX="/opt/homebrew"
FISH_BIN="$BREW_PREFIX/bin/fish"

# --- output helpers ---------------------------------------------------------

if [ -t 1 ]; then
  BOLD=$(printf '\033[1m') DIM=$(printf '\033[2m')
  GREEN=$(printf '\033[32m') YELLOW=$(printf '\033[33m') RESET=$(printf '\033[0m')
else
  BOLD='' DIM='' GREEN='' YELLOW='' RESET=''
fi

phase_num=0
phase() {
  phase_num=$((phase_num + 1))
  printf '\n%s==> [%d/10] %s%s\n' "$BOLD" "$phase_num" "$1" "$RESET"
}
ok() { printf '  %s✓%s %s\n' "$GREEN" "$RESET" "$1"; }
skip() { printf '  %s· %s (already done)%s\n' "$DIM" "$1" "$RESET"; }
warn() { printf '  %s! %s%s\n' "$YELLOW" "$RESET" "$1"; }
have() { command -v "$1" >/dev/null 2>&1; }

cd "$HOME" # mise resolves its global config relative to cwd

# --- 1. Xcode Command Line Tools -------------------------------------------

phase "Xcode Command Line Tools"
if xcode-select -p >/dev/null 2>&1; then
  skip "$(xcode-select -p)"
else
  warn "Accept the GUI prompt; this resumes when it finishes."
  xcode-select --install || true
  until xcode-select -p >/dev/null 2>&1; do
    sleep 15
    printf '  %s· waiting…%s\n' "$DIM" "$RESET"
  done
  ok "Command Line Tools installed"
fi

# --- 2. Homebrew ------------------------------------------------------------

phase "Homebrew"
if [ -x "$BREW_PREFIX/bin/brew" ]; then
  skip "brew $("$BREW_PREFIX/bin/brew" --version | head -1 | awk '{print $2}')"
else
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ok "Homebrew installed"
fi
eval "$("$BREW_PREFIX/bin/brew" shellenv)"

# --- 3. Dotfiles repo -------------------------------------------------------

phase "Dotfiles repo at ~/.config"
# ~/.config already exists on a fresh macOS, so `git clone` into it fails —
# init in place instead. Over HTTPS, since SSH keys don't exist yet; phase 9
# swaps the remote.
if [ -d "$CONFIG_DIR/.git" ]; then
  # Never check out over an existing repo; it would discard uncommitted work.
  skip "repo present on branch $(git -C "$CONFIG_DIR" rev-parse --abbrev-ref HEAD)"
  if ! git -C "$CONFIG_DIR" diff --quiet || ! git -C "$CONFIG_DIR" diff --cached --quiet; then
    warn "working tree is dirty — not touching it"
  fi
else
  mkdir -p "$CONFIG_DIR"
  git init -q "$CONFIG_DIR"
  git -C "$CONFIG_DIR" remote add origin "$REPO_HTTPS"
  git -C "$CONFIG_DIR" fetch -q --depth=1 origin main
  git -C "$CONFIG_DIR" checkout -f -B main origin/main
  ok "checked out main into $CONFIG_DIR"
fi

# --- 4. Homebrew packages ---------------------------------------------------

phase "Homebrew packages (Brewfile)"
if [ -f "$CONFIG_DIR/Brewfile" ]; then
  # --adopt lets a cask take over an app already sitting in /Applications.
  # No-op on a fresh machine; needed when adopting one set up by hand.
  if HOMEBREW_CASK_OPTS="--adopt" brew bundle install --file="$CONFIG_DIR/Brewfile"; then
    ok "Brewfile satisfied"
  else
    # One stubborn cask shouldn't abort the remaining phases.
    warn "brew bundle reported failures — see above. For a cask whose app"
    warn "already exists: brew install --cask --adopt <token>"
  fi
else
  warn "no Brewfile at $CONFIG_DIR/Brewfile — skipping"
fi

# --- 5. fish as the login shell --------------------------------------------

phase "fish as login shell"
if [ ! -x "$FISH_BIN" ]; then
  warn "$FISH_BIN not found (Brewfile phase incomplete?) — skipping"
else
  # Check first: plain >> is how /etc/shells collected duplicate fish entries.
  if grep -qxF "$FISH_BIN" /etc/shells; then
    skip "$FISH_BIN listed in /etc/shells"
  else
    warn "Appending to /etc/shells (needs sudo)"
    printf '%s\n' "$FISH_BIN" | sudo tee -a /etc/shells >/dev/null
    ok "registered in /etc/shells"
  fi

  current_shell=$(dscl . -read "/Users/$USER" UserShell 2>/dev/null | awk '{print $2}')
  if [ "$current_shell" = "$FISH_BIN" ]; then
    skip "login shell is already fish"
  else
    warn "Changing login shell from ${current_shell:-unknown} to fish"
    chsh -s "$FISH_BIN"
    ok "login shell set to fish"
  fi
fi

# --- 6. fish plugins (fisher) ----------------------------------------------

phase "fish plugins (fisher)"
# fisher and plugin-git's functions are tracked here, so the clone already
# supplied them and `fisher update` just reconciles against fish_plugins.
# Skipping oh-my-fish on purpose — it collides with fisher.
if [ ! -x "$FISH_BIN" ]; then
  warn "fish not installed — skipping"
elif [ ! -f "$CONFIG_DIR/fish/fish_plugins" ]; then
  warn "no fish_plugins manifest — skipping"
else
  if ! "$FISH_BIN" -c 'functions -q fisher' 2>/dev/null; then
    "$FISH_BIN" -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
    ok "fisher installed"
  else
    skip "fisher present (tracked in repo)"
  fi
  "$FISH_BIN" -c 'fisher update'
  ok "plugins reconciled with fish_plugins"
fi

# --- 7. mise runtimes -------------------------------------------------------

phase "mise runtimes"
if ! have mise; then
  warn "mise not installed (Brewfile phase incomplete?) — skipping"
else
  # asdf-era file using legacy names (nodejs, golang) that mise still reads.
  if [ -f "$HOME/.tool-versions" ]; then
    mv "$HOME/.tool-versions" "$HOME/.tool-versions.bak"
    ok "moved stale ~/.tool-versions aside"
  fi
  mise install
  ok "$(mise ls --current 2>/dev/null | grep -c . || echo 0) tools active"
fi

# --- 8. Globals outside brew and mise --------------------------------------

phase "Globals outside brew/mise"
# Kept small on purpose. Not restoring the old machine's ~540 global gems —
# that was app dependencies leaking out of a bundle.
if ! have mise; then
  warn "mise unavailable — skipping globals"
else
  # Neovim's python provider has to live in the interpreter itself.
  if mise exec -- python -c 'import pynvim' >/dev/null 2>&1; then
    skip "pynvim"
  else
    mise exec -- python -m pip install --quiet --upgrade pynvim && ok "pynvim"
  fi

  # As uv tools these survive a python version bump; pip-installed they don't.
  for tool in pre-commit vgs-cli; do
    if mise exec -- uv tool list 2>/dev/null | grep -q "^$tool "; then
      skip "$tool"
    else
      mise exec -- uv tool install "$tool" && ok "$tool"
    fi
  done

  # The only gems worth having outside a bundle.
  for gem in bundler ruby-lsp rubocop foreman kamal; do
    if mise exec -- gem list -i "^$gem\$" >/dev/null 2>&1; then
      skip "gem $gem"
    else
      mise exec -- gem install --no-document "$gem" && ok "gem $gem"
    fi
  done
fi

if have claude; then
  skip "Claude Code"
else
  curl -fsSL https://claude.ai/install.sh | bash && ok "Claude Code"
fi

# --- 9. $HOME symlinks and SSH remote --------------------------------------

phase "\$HOME symlinks and SSH remote"
# zsh and tmux don't read $XDG_CONFIG_HOME.
for pair in ".zshrc:.zshrc" ".tmux.conf:.tmux.conf"; do
  src="$CONFIG_DIR/${pair%%:*}"
  dst="$HOME/${pair##*:}"
  if [ ! -e "$src" ]; then
    warn "$src missing — skipping link"
  elif [ "$(readlink "$dst" 2>/dev/null)" = "$src" ]; then
    skip "$dst"
  else
    ln -sfn "$src" "$dst"
    ok "$dst -> $src"
  fi
done

# Last, so it only happens on an otherwise-successful run.
if [ -d "$CONFIG_DIR/.git" ]; then
  if [ "$(git -C "$CONFIG_DIR" remote get-url origin 2>/dev/null)" = "$REPO_SSH" ]; then
    skip "origin already on SSH"
  else
    git -C "$CONFIG_DIR" remote set-url origin "$REPO_SSH"
    ok "origin switched to SSH (needs your key — see README)"
  fi
fi

# --- 10. Manual checklist ---------------------------------------------------

phase "What is left to do by hand"
cat <<'CHECKLIST'
  These can't be scripted, or aren't in the repo on purpose:

  [ ] SSH + GPG keys from 1Password       (origin is now SSH; git push needs this)
  [ ] ~/.gitconfig and ~/.gitconfig.a6z   (work overrides — not tracked)
  [ ] ~/.zsh_aliases_private              (sourced by .zshrc — not tracked)
  [ ] ~/.netrc
  [ ] ~/.config/karabiner/                (gitignored — restore out of band)
  [ ] Android SDK                         (in-app download from Android Studio)
  [ ] herdr binary                        (config is tracked; installer is not)
  [ ] macOS Accessibility + Screen Recording grants for aerospace, sketchybar,
      borders, Karabiner-Elements, Raycast — they fail silently without these
  [ ] Raycast settings + license
  [ ] Apps with no cask: Tidewave, Doll, Iru Self Service, GP-200, Tonebridge,
      Jabra Firmware Update, Notion Web Clipper, Be Focused

  Then: open a new terminal (login shell is fish) and check `mise ls --current`.
CHECKLIST

printf '\n%sBootstrap complete.%s\n' "$BOLD" "$RESET"
