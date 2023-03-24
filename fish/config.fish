if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias dbw="cd ~/Documents/Lavanda/direct-booking-websites"
alias hdb="cd ~/Documents/Lavanda/hanami-direct-bookings"
alias lvdam="cd ~/Documents/Lavanda/lvdam"
alias invoicing="cd ~/Documents/Lavanda/invoicing"
alias crm="cd ~/Documents/Lavanda/crm"
alias offer_management="cd ~/Documents/Lavanda/offer_management"
alias pms="cd ~/Documents/Lavanda/pms"
alias platapi="cd ~/Documents/Lavanda/platapi"
alias authapi="cd ~/Documents/Lavanda/auth-api"
alias nvim_config="cd ~/.config/nvim/"
alias ber="bundle exec rspec"
alias be="bundle exec"
alias cat="bat --paging=never"
alias lzg="lazygit"
alias lzd="lazydocker"

set -x BUNDLE_GITHUB__COM x-access-token:$github_token
set -x BUNDLE_ENTERPRISE__CONTRIBSYS__COM $sidekiq_token
set -x NPM_TOKEN $npm_token
set -x NPM_GH_TOKEN $npm_gh_token
set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM tmux-256color
set -x GPG_TTY (tty)

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

function ggone
    git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs git branch -D
end

fish_add_path (python3 -m site --user-base)/bin
fish_add_path /home/victor/.rover/bin

starship init fish | source

source ~/.asdf/asdf.fish
