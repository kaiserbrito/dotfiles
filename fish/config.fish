if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvim_config="cd ~/.config/nvim/"
alias ber="bundle exec rspec"
alias be="bundle exec"
alias cat="bat --paging=never"
alias lzg="lazygit"
alias lzd="lazydocker"
alias vim="nvim"
alias gen_swagger="bundle exec rake rswag:specs:swaggerize"

set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x HOMEBREW_PREFIX "/opt/homebrew"
set -x GPG_TTY (tty)
set -x RUBY_YJIT_ENABLE 1

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

starship init fish | source

source ~/.asdf/asdf.fish

eval "$(/opt/homebrew/bin/brew shellenv)"

rbenv init - fish | source

fzf --fish | source

zoxide init fish | source
