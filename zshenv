setopt no_global_rcs
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export DEFAULT_USER="toja92"
export EDITOR="vim"
export KEYTIMEOUT=1
export XDG_CONFIG_HOME="~/.config"
export SAVEHIST=1000000

typeset -gU path

if [ -d "/usr/local/bin" ]; then
    path[1,0]=/usr/local/bin
fi;

if [ -d "$HOME/.composer/vendor/bin" ]; then
    path[1,0]=$HOME/.composer/vendor/bin
fi;

if [ -d "/usr/local/bin" ]; then
    path[1,0]=/usr/local/bin
fi;

if [ -d "$HOME/bin/wine/bin" ]; then
    path[1,0]=$HOME/bin/wine/bin
fi;

