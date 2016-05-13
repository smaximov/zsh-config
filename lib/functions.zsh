yes-no() {
    local yn="$fg[green]Y${reset_color}/n"
    read -q "reply?$1 ${yn} "
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

check-for-update() {
    local zsh="$fg[cyan]ZSH config${reset_color}"
    local scheduled="$zsh: last update was more than ${UPDATE_INTERVAL_DAYS} days ago; update now?"
    local first_time="$zsh: the time of the last update is unknown; update now?"

    if [[ -f $ZSH_CACHE_DIR/last-update ]]; then
        if time-to-update && yes-no $scheduled; then
            update-zsh-config
        fi
    elif yes-no $first_time; then
        update-zsh-config
    fi
}
