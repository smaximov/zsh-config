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

# Nix setup
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
