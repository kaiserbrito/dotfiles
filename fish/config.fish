if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias nvim_config="cd ~/.config/nvim/"
alias ber="bundle exec rspec"
alias be="bundle exec"
alias cat="bat --paging=never"
alias lzg="lazygit"
alias lzd="lazydocker"

set -x EDITOR nvim
set -x DISABLE_SPRING 1
set -x TERM screen-256color
set -x HOMEBREW_PREFIX "/opt/homebrew"
set -x GPG_TTY (tty)
set -x SRC_ACCESS_TOKEN $src_access_token
set -x SRC_ENDPOINT $src_endpoint
set -gx LDFLAGS "-L$HOMEBREW_PREFIX/opt/imagemagick@6/lib"
set -gx CPPFLAGS "-I$HOMEBREW_PREFIX/opt/imagemagick@6/include"
set -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH:$HOMEBREW_PREFIX/opt/imagemagick@6/lib/pkgconfig"
# set -gx LDFLAGS "-L$HOMEBREW_PREFIX/opt/jemalloc/lib"
# set -gx CPPFLAGS "-I$HOMEBREW_PREFIX/opt/jemalloc/include"

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
fish_add_path $HOMEBREW_PREFIX/sbin
fish_add_path $HOMEBREW_PREFIX/opt/libpq/bin
fish_add_path $HOMEBREW_PREFIX/opt/imagemagick@6/bin
# fish_add_path /opt/homebrew/opt/postgresql@15/bin

starship init fish | source

source ~/.asdf/asdf.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
