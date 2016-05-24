alias e="nocorrect emacsclient -t"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -v"
alias kill-emacs="emacsclient -t -e '(kill-emacs)'"
alias sdcv="sdcv --color"

# Disable globs for following commands
alias find='noglob find'
alias bower="noglob bower"
alias apt-get='noglob apt-get'
alias aptitude='noglob aptitude'
alias yum='noglob yum'

# Global aliases
alias -g L='| less'
alias -g X='| xclip -i'
alias -g G='| grep -P'
