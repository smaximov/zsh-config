# Auto-update routine
if auto-update-enabled; then
    check-for-update
fi

# https://github.com/nvbn/thefuck
(( $+commands[thefuck] )) && eval "$(thefuck --alias)"

# Integrate Awesome with Gnome Keyring Daemon
if [[ $GDMSESSION == 'awesome' ]] ; then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi
