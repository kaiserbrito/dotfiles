# dotfiles

macOS config, checked out **in place** at `~/.config` — no stow, no chezmoi, no
symlink farm. The repo *is* the config directory. Only two files need links into
`$HOME` (`.zshrc`, `.tmux.conf`) because zsh and tmux don't read
`$XDG_CONFIG_HOME`; `bootstrap.sh` creates them.

## New machine

```sh
curl -fsSL https://raw.githubusercontent.com/kaiserbrito/dotfiles/main/bootstrap.sh | bash
```

Run it attended — two phases need you:

- **Xcode CLT** opens a GUI installer; the script polls until it finishes.
- **fish as login shell** needs `sudo` (to append to `/etc/shells`) and your
  password again for `chsh`.

Everything is idempotent, so re-running is safe and skips completed work. It
never checks out over an existing repo, so it won't touch uncommitted changes.

Then work through the [manual checklist](#manual-checklist) below and open a new
terminal.

## What owns what

Keeping these boundaries clear is the whole point — a tool installed twice from
two managers is a version conflict waiting to happen.

| Manager | Owns | Declared in |
| --- | --- | --- |
| Homebrew | CLI tools, GUI apps, fonts | `Brewfile` |
| mise | language runtimes + version-pinned CLIs | `mise/config.toml` |
| fisher | fish plugins | `fish/fish_plugins` |
| vim.pack | Neovim plugins | `nvim/nvim-pack-lock.json` |

`caddy` and `sops` are **mise-owned**, deliberately absent from the `Brewfile`.
`uv` is mise-owned too — don't reinstall it with its standalone installer.

Every mise version is pinned. `"latest"` would let a new machine drift from this
one silently, so bump versions as explicit commits.

### Adopting apps installed by hand

`bootstrap.sh` runs `brew bundle` with `HOMEBREW_CASK_OPTS=--adopt`, so a cask
takes ownership of an app already sitting in `/Applications` instead of failing.
To adopt one manually:

```sh
brew install --cask --adopt <token>
```

### Common operations

```sh
brew bundle install --file=~/.config/Brewfile   # install/update everything
brew bundle check  --file=~/.config/Brewfile --verbose
brew bundle cleanup --file=~/.config/Brewfile   # list brew-installed extras (add --force to remove)
mise install                                    # install pinned runtimes
mise ls --current
fisher update                                   # reconcile fish plugins
```

After installing something you want to keep, add it to the `Brewfile` or
`mise/config.toml` — otherwise the next machine won't have it. That drift is
what this repo exists to prevent.

## Manual checklist

Not scriptable, or deliberately untracked.

- [ ] **SSH + GPG keys** from 1Password. `bootstrap.sh` switches `origin` to SSH
      at the end, so `git push` needs these. `config.fish` also sets `GPG_TTY`.
- [ ] **`~/.gitconfig`** and **`~/.gitconfig.a6z`** — work overrides, not tracked.
- [ ] **`~/.zsh_aliases_private`** — sourced by `.zshrc`, deliberately not tracked.
- [ ] **`~/.netrc`**
- [ ] **`~/.config/karabiner/`** — ⚠️ gitignored. The `karabiner-elements` cask
      installs, but arrives with zero config. Restore out of band.
- [ ] **Android SDK** — `config.fish` sets `ANDROID_HOME=~/Library/Android/sdk`
      and puts `emulator`/`platform-tools` on `PATH`. The `android-studio` cask
      installs only the IDE; the SDK is an in-app download.
- [ ] **`herdr`** — config is tracked at `herdr/config.toml`, but it's a
      standalone binary in `~/.local/bin`. Record the installer here once known.
- [ ] **macOS Accessibility + Screen Recording grants** for `aerospace`,
      `sketchybar`, `borders`, Karabiner-Elements, Raycast. These fail *silently*
      without permissions — the WM just doesn't respond.
- [ ] **Raycast** settings + license.
- [ ] **Apps with no cask:** Tidewave, Doll, Iru Self Service (corp MDM), GP-200,
      Tonebridge, Jabra Firmware Update, Notion Web Clipper, Be Focused.
- [ ] **`bun`** (optional) — installed at `~/.bun` by its own installer, wired up
      in `.zshrc` but *not* in `config.fish`, so it's invisible in the actual
      login shell. Only global package is `localtunnel`. Decide whether it's
      wanted before reinstalling.

## Not restored on purpose

- **The ~540-gem global gemset.** That was a Rails app's dependency tree leaking
  out of a bundle. `bundle install` regenerates it per project. `bootstrap.sh`
  installs only `bundler`, `ruby-lsp`, `rubocop`, `foreman`, `kamal`.
- **oh-my-fish.** It coexisted with fisher and the two collide — see the guard in
  `fish/conf.d/git.fish`. fisher is the only fish plugin manager now.
- **`yabai`, `skhd`, `gitui`, `zellij`, `oh-my-posh`, `nvim_old`.** Configs are
  still tracked (harmless, and useful history), but these are superseded:
  aerospace + sketchybar + borders for window management, and the native-Neovim
  config in `nvim/`.
- **`~/.tool-versions`.** A stale asdf-era file using legacy plugin names
  (`nodejs`, `golang`). mise still lists it in `config_files`, so `bootstrap.sh`
  moves it aside. asdf is gone; mise replaced it.

## Layout

```
.zshrc  .tmux.conf  starship.toml      symlinked or read from $HOME
Brewfile  bootstrap.sh                 machine setup
fish/                                  login shell (+ fisher plugins, g* git helpers)
nvim/                                  native Neovim, vim.pack (nvim_old/ = retired lazy.nvim)
mise/config.toml                       pinned runtimes
aerospace/                             tiling WM (with brew sketchybar + borders)
ghostty/ kitty/ alacritty/ wezterm/    terminals, all Catppuccin Mocha
lazygit/ jj/ gitui/                    git & VCS
btop/ bottom/                          system monitors
opencode/ tidewave/                    AI tooling
herdr/ pgcli/ lazydocker/ uv/          dev tooling
```
