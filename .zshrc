# -*- mode: sh; -*-

ZSH=$XDG_DATA_HOME/oh-my-zsh

# Custom directory location
ZSH_CUSTOM=$ZDOTDIR/custom
ZSH_THEME="nameless"

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

# update every 7 days by default
UPDATE_INTERVAL_DAYS=7

# Custom enviroment variables
[[ -f $ZDOTDIR/custom.env ]] && source $ZDOTDIR/custom.env

yes-no() {
    read -q "reply?${1} [Y/n]: "
    local ret=$?

    if [[ "$reply" == $'\n' ]]; then
        return 0                # Enter was hit
    else
        echo                    # insert newline
    fi

    return $ret
}

update-zsh-config() {
    $ZDOTDIR/tools/update-zsh-config.sh "$@"
}

auto-update-enabled() {
    return ${+DISABLE_AUTO_UPDATE}
}

time-to-update() {
    local update_interval=$(( $UPDATE_INTERVAL_DAYS * 24 * 60 * 60 ))
    local current_time=$(date +%s)
    local last_update_time=$(stat -c %Z $ZSH_CACHE_DIR/last-update)

    return $(( ($current_time - $last_update_time) < $update_interval ))
}
