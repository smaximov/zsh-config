# -*- mode: sh; -*-

ZSH=$XDG_DATA_HOME/oh-my-zsh
ZSH_THEME="norm"

# Plugins
plugins=(git extract ruby rails cake bundler coffee npm pip scala)

# Create ZSH cache directory unless it already exists
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias bower="noglob bower"
alias e="nocorrect emacsclient -t"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias kill-emacs="emacsclient -t -e '(kill-emacs)'"
alias sdcv="sdcv --color"

# Global aliases
alias -g L='| less'
alias -g X='| xclip -i'
alias -g G='| grep -P'

update-zsh-config() {
    env ZSH=$ZSH ZDOTDIR=$ZDOTDIR $ZDOTDIR/tools/update-zsh-config.sh "$@"
}
