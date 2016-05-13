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
