if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# Aliases
alias vim="nvim"
alias lzg="lazygit"
alias lzd="lazydocker"
alias be="bundle exec"
alias ber="bundle exec rails"

# eza
abbr -a l eza -l --icons --git -a
abbr -a lt eza --tree --level=2 --long --icons --git
abbr -a ltree eza --tree --level=2  --icons --git


fish_add_path /opt/homebrew/opt/postgresql@17/bin
# Exports
set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x FZF_DEFAULT_COMMAND "fd"
set -x GPG_TTY (tty)
set -x RUBY_YJIT_ENABLE 1
set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@17/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@17/include"
set -x FPROF 1

direnv hook fish | source
fzf --fish | source
zoxide init fish | source
starship init fish | source
mise activate fish | source
