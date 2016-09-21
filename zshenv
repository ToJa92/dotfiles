export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export DEFAULT_USER="toja92"
export EDITOR="vim"
export KEYTIMEOUT=1

typeset -U path

if [ -d "/usr/local/bin" ]; then
    path[1,0]=/usr/local/bin
fi;

if [ -d "$HOME/.composer/vendor/bin" ]; then
    path[1,0]=$HOME/.composer/vendor/bin
fi;

if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    path[1,0]=$HOME/Library/Python/2.7/bin
fi;

RUBY_BIN_FOLDER=$(ruby -rubygems -e 'puts Gem.user_dir')
RUBY_BIN_FOLDER+=/bin
if [ -d "$RUBY_BIN_FOLDER" ]; then
    path[1,0]=$RUBY_BIN_FOLDER
fi;

if (( $+commands[brew] )) ; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

