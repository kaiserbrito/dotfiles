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

abbr -a stg_console "ecs_console staging"
abbr -a infratest_console "ecs_console test"
abbr -a prod_console "ecs_console production"
abbr -a demo_console "ecs_console demo"
abbr -a bugflow_console "ecs_console bugflow"

# Exports
set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x FZF_DEFAULT_COMMAND "fd"
set -x GPG_TTY (tty)
set -x RUBY_YJIT_ENABLE 1
set -x FPROF 1
set -l output (mole completion fish 2>/dev/null); and echo "$output" | source
set -x ANDROID_HOME $HOME/Library/Android/sdk

fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /opt/homebrew/opt/openjdk@17/bin

# Manual override if activation hook fails to prepend
fish_add_path --move --prepend "$HOME/.local/share/mise/shims"

direnv hook fish | source
fzf --fish | source
zoxide init fish | source
starship init fish | source
