export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export DEFAULT_USER="toja92"
export EDITOR="vim"
export KEYTIMEOUT=1
export XDG_CONFIG_HOME="~/.config"

typeset -U path

if [ -d "/usr/local/bin" ]; then
    path[1,0]=/usr/local/bin
fi;

if [ -d "$HOME/.composer/vendor/bin" ]; then
    path[1,0]=$HOME/.composer/vendor/bin
fi;

