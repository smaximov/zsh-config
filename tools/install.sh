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

main() {
    need git
    need zsh
    need mkdir
    need chsh
    need ln
    need umask

    ensure umask g-w,o-w

    printf "installing Oh My Zsh...\n"
    ensure mkdir -p "$ZSH"
    ensure git clone --depth=1 "$OH_MY_ZSH_REPO" "$ZSH"

    printf "installing zsh config...\n"
    ensure mkdir -p "$ZDOTDIR"
    ensure git clone "$ZSH_CONFIG_REPO" "$ZDOTDIR"

    # ensure ZSH cache dir exists
    [ -d $ZSH_CACHE_DIR ] || mkdir -p $ZSH_CACHE_DIR
    # set update marker
    touch $ZSH_CACHE_DIR/last-update

    printf "creating symlink from '$HOME/.zshenv' to '$ZDOTDIR/.zshenv'...\n"
    ensure ln -fs $(readlink -e "$ZDOTDIR/.zshenv") "$HOME/.zshenv"

    printf 'changing your default shell to zsh...\n'
    me=$USER
    ensure as_root chsh -s $(grep "zsh$" /etc/shells | tail -1) "$me"

    printf "%s" "$fg_bold[green]"
    printf 'ZSH config is successefully installed!\n'
    printf "%s" "$reset_color"
}

die() {
    printf "$fg_bold[red]ERROR${reset_color}: %s\n" $1 >&2
    exit 1
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
