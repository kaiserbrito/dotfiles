eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Must Load OMZ Git library
zinit snippet OMZL::git.zsh

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::z

# Brew completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias lzg='lazygit'
alias be='bundle exec'

# Functions
local-db() {
  local db_name=$1
  local db_user=$2
  local db_password=$3

  docker run --name local-db -e POSTGRES_USER=$db_user -e POSTGRES_PASSWORD=$db_password -e POSTGRES_DB=$db_name -p 5432:5432 -v $db_name:/var/lib/postgresql/data -d postgres:alpine
}

# Exports
export EDITOR='nvim'
export TERM='screen-256color'
export FZF_DEFAULT_COMMAND='fd'
export DISABLE_SPRING=1
export RUBY_YJIT_ENABLE=1
export GPG_TTY=$(tty)

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
