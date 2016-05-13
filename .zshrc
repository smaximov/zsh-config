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
    # update every 7 days by default
    local update_interval=$(( ${UPDATE_INTERVAL_DAYS:-7} * 24 * 60 * 60 ))
    local current_time=$(date +%s)
    local last_update_time=$(stat -c %Z $ZSH_CACHE_DIR/last-update)

    return $(( ($current_time - $last_update_time) < $update_interval ))
}

if auto-update-enabled; then
    if [[ -f $ZSH_CACHE_DIR/last-update ]]; then
        if time-to-update && \\
           yes-no "ZSH config: last update was more than ${UPDATE_INTERVAL_DAYS} days ago; update now?"; then
            update-zsh-config
        fi
    elif yes-no "ZSH config: the time of the last update is unknown; update now?"; then
        update-zsh-config
    fi
fi
