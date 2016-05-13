#!/bin/sh

set -u

XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_CACHE_HOME=$HOME/.cache

ZDOTDIR=$XDG_CONFIG_HOME/zsh
ZSH=$XDG_DATA_HOME/oh-my-zsh
ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

OH_MY_ZSH_REPO="https://github.com/robbyrussell/oh-my-zsh.git"
ZSH_CONFIG_REPO="https://github.com/smaximov/zsh-config.git"

if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

main() {

    need git
    need zsh
    need mkdir
    need chsh
    need ln
    need umask

    ensure umask g-w,o-w

    info "Installing Oh My Zsh..."

    if git_repo "$ZSH"; then
        warn "Already a git repository: '$ZSH'"
    else
        ensure mkdir -p "$ZSH"
        ensure git clone --depth=1 "$OH_MY_ZSH_REPO" "$ZSH"
    fi

    info "installing zsh config..."


    if git_repo "$ZDOTDIR"; then
        warn "Already a git repository: '$ZDOTDIR'"
    else
        ensure mkdir -p "$ZDOTDIR"
        ensure git clone "$ZSH_CONFIG_REPO" "$ZDOTDIR"
    fi

    # ensure ZSH cache dir exists
    [ -d $ZSH_CACHE_DIR ] || mkdir -p $ZSH_CACHE_DIR
    # set update marker
    touch $ZSH_CACHE_DIR/last-update

    info "Creating symlink from '$HOME/.zshenv' to '$ZDOTDIR/.zshenv'..."
    ensure ln -fs $(readlink -e "$ZDOTDIR/.zshenv") "$HOME/.zshenv"

    if [ "$(shell)" != "zsh" ]; then
        info 'Changing your default shell to zsh...'
        ensure as_root chsh -s $(grep "zsh$" /etc/shells | tail -1) "$USER"
    fi

    success "ZSH config is successefully installed!"
    success "Type 'env zsh' to login to ZSH immediately"
}

shell() {
    echo $SHELL | awk -F/ '{ print $NF }'
}

git_repo() {
    [ -d "$1/.git" ]
}

die() {
    printf "$(color "$BOLD$RED" "%s")\n" "$1" >&2
    exit 1
}

warn() {
    printf "$(color "$BOLD$YELLOW" "%s")\n" "$1"
}

info() {
    printf "$(color "$BOLD$BLUE" "%s")\n" "$1"
}

success() {
    printf "$(color "$BOLD$GREEN" "%s")\n" "$1"
}

color() {
    echo "$1$2$NORMAL"
}

need() {
    if ! command -v "$1" > /dev/null 2>&1; then
        die "need '$1' (command not found)"
    fi
}

as_root() {
    if [ $(id -u) -ne 0 ]; then
        sudo "$@"               # need sudo
    else
        "$@"                    # root
    fi
}

ensure() {
    "$@"
    if [ $? != 0 ]; then
        die "command failed: $*"
    fi
}

main "$@" || exit 1
