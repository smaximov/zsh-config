# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load NVM
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

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

(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

[[ -s "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]] && source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
