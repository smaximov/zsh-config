#!/bin/sh

set -u

XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh
ZSH=$XDG_DATA_HOME/oh-my-zsh

OH_MY_ZSH_REPO="https://github.com/robbyrussell/oh-my-zsh.git"
ZSH_CONFIG_REPO="https://github.com/smaximov/zsh-config.git"

main() {
    need git
    need zsh
    need mkdir
    need chsh
    need ln
    need umask

    ensure umask g-w,o-w

    echo "installing Oh My Zsh..."
    ensure mkdir -p "$ZSH"
    ensure git clone --depth=1 "$OH_MY_ZSH_REPO" "$ZSH"

    echo "installing zsh config..."
    ensure mkdir -p "$ZDOTDIR"
    ensure git clone "$ZSH_CONFIG_REPO" "$ZDOTDIR"

    echo "creating symlink from '$HOME/.zshenv' to '$ZDOTDIR/.zshenv'..."
    ensure ln -fs $(readlink -e "$ZDOTDIR/.zshenv") "$HOME/.zshenv"

    echo "changing your default shell to zsh..."
    me=$USER
    ensure as_root chsh -s $(grep "zsh$" /etc/shells | tail -1) "$me"

    echo "zsh config installed! now login to zsh"
}

die() {
    echo "$1" >&2
    exit 1
}

need() {
    if ! command -v "$1" > /dev/null 2>&1; then
        die "need '$1' (command not found)"
    fi
}

as_root() {
    if [[ $EUID -ne 0 ]]; then
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
