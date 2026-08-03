# CLI tools, GUI apps and fonts.
#
#   brew bundle install --file="$HOME/.config/Brewfile"
#
# Language runtimes live in mise/config.toml, not here.

# --- Taps -------------------------------------------------------------------
# Formula names below are fully qualified and auto-tap; the casks need these.
tap "felixkratz/formulae"     # borders, sketchybar
tap "gigalixir/brew"
tap "go-task/tap"
tap "homebrew/services"
tap "jesseduffield/lazydocker"
tap "nikitabobko/tap"         # aerospace
tap "peonping/tap"
tap "stripe/stripe-cli"
tap "withgraphite/tap"
tap "zen-browser/browser"

# --- Shells & prompt --------------------------------------------------------
brew "fish"                   # login shell; bootstrap.sh registers it
brew "nushell"
brew "starship"

# --- Core CLI ---------------------------------------------------------------
brew "bat"
brew "coreutils"
brew "curl"
brew "eza"
brew "fd"
brew "fzf"
brew "gnu-sed"
brew "jq"
brew "sevenzip"
brew "tldr"
brew "wget"
brew "yazi"
brew "zoxide"

# --- Editor -----------------------------------------------------------------
brew "neovim"
brew "luarocks"               # nvim plugin builds
brew "tree-sitter-cli"

# --- Git & VCS --------------------------------------------------------------
brew "git"
brew "git-filter-repo"
brew "gh"
brew "jj"
brew "lazygit"
brew "withgraphite/tap/graphite"

# --- Terminal multiplexer ---------------------------------------------------
brew "tmux"

# --- Containers & VMs -------------------------------------------------------
brew "colima"
brew "docker"
brew "docker-buildx"
brew "docker-compose"
brew "jesseduffield/lazydocker/lazydocker"
brew "podman"
brew "qemu"

# --- Cloud & deploy ---------------------------------------------------------
brew "awscli"
brew "aws-vault"
brew "flyctl"
brew "gigalixir/brew/gigalixir"
brew "railway"

# --- Dev tooling ------------------------------------------------------------
brew "act"                    # run GitHub Actions locally
brew "direnv"
brew "go-task/tap/go-task"
brew "hurl"
brew "opencode"
brew "pgcli"
brew "rtk"
brew "semgrep"
brew "talisman"               # pre-commit secret scanner

# --- macOS window management ------------------------------------------------
# Pairs with the aerospace cask. Needs Accessibility grants to do anything —
# see README.
brew "felixkratz/formulae/borders"
brew "felixkratz/formulae/sketchybar"

# --- System monitors & maintenance ------------------------------------------
brew "bottom"
brew "btop"
brew "htop"
brew "mole"                   # config.fish calls `mole completion`
brew "ncspot"
brew "peonping/tap/peon-ping"

# --- Toolchain deps ---------------------------------------------------------
# openjdk@17 is on PATH via config.fish. The rest are orphaned leaves —
# something depended on them once. Cheap to keep.
brew "openjdk@17"
brew "icu4c@76"
brew "jpeg"
brew "openssl@3.0"
brew "python-setuptools"
brew "vips"

# --- Stripe -----------------------------------------------------------------
brew "stripe/stripe-cli/stripe"

# ============================================================================
# Casks
# ============================================================================

# --- Terminals --------------------------------------------------------------
cask "alacritty"
cask "ghostty"
cask "kitty"
cask "wezterm"

# --- Fonts ------------------------------------------------------------------
cask "font-commit-mono-nerd-font"
cask "font-meslo-lg-nerd-font"

# --- Window management ------------------------------------------------------
cask "aerospace"
cask "karabiner-elements"     # ~/.config/karabiner is gitignored — see README
cask "raycast"

# --- Browsers ---------------------------------------------------------------
cask "brave-browser"
cask "firefox"
cask "firefox@developer-edition"
cask "google-chrome"
cask "zen"

# --- Work / comms -----------------------------------------------------------
cask "1password"
cask "aircall"
cask "loom"
cask "slack"
cask "zoom"

# --- Dev GUI ----------------------------------------------------------------
cask "android-studio"         # IDE only; the SDK is an in-app download
cask "postman"

# --- Media ------------------------------------------------------------------
cask "spotify"
cask "tuxguitar"
cask "vlc"
