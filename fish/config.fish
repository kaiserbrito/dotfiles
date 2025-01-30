if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# Aliases
alias vim="nvim"
alias lzg="lazygit"
alias be="bundle exec"
alias ber="bundle exec rails"

# eza
abbr -a l eza -l --icons --git -a
abbr -a lt eza --tree --level=2 --long --icons --git
abbr -a ltree eza --tree --level=2  --icons --git

# Exports
set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x FZF_DEFAULT_COMMAND "fd"
set -x GPG_TTY (tty)
set -x RUBY_YJIT_ENABLE 1
set -gx LDFLAGS "-L/opt/homebrew/opt/postgresql@16/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/postgresql@16/include"

# Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end
function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

direnv hook fish | source
fzf --fish | source
zoxide init fish | source
starship init fish | source
mise activate fish | source
