
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:/opt/mssql-tools/bin"
export SSL_CERT_FILE=/usr/lib/ssl/certs/cacert.pem
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
