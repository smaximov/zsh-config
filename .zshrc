# -*- mode: sh; -*-

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

# Plugins
plugins=(git extract ruby rails cake bundler coffee npm pip scala)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias bower="noglob bower"
alias e="nocorrect emacsclient -t -a ''"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias kill-emacs="emacsclient -t -e '(kill-emacs)'"
alias sdcv="sdcv --color"

# Global aliases
alias -g L='| less'
alias -g X='| xclip -i'
alias -g G='| grep -P'
