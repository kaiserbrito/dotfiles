if status is-interactive
    # Commands to run in interactive sessions can go here
    mise activate fish | source
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

abbr -a stg1_console "ecs_console staging 1"
abbr -a stg3_console "ecs_console staging 3"
abbr -a stg5_console "ecs_console staging 5"
abbr -a stg6_console "ecs_console staging 6"
abbr -a prod_console "ecs_console production"
abbr -a demo_console "ecs_console demo"

# Exports
set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x FZF_DEFAULT_COMMAND "fd"
set -x GPG_TTY (tty)
set -x RUBY_YJIT_ENABLE 1
set -x FPROF 1
set -l output (mole completion fish 2>/dev/null); and echo "$output" | source

# Manual override if activation hook fails to prepend
fish_add_path --move --prepend "$HOME/.local/share/mise/shims"

direnv hook fish | source
fzf --fish | source
zoxide init fish | source
starship init fish | source
