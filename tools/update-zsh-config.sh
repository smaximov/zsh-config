#!/usr/bin/zsh

set -u

usage() {
    cat <<EOF
Usage: update-zsh-config [-h|--help] [--o|--oh-my-zsh]
Update ZSH config.

Options:
  -h, --help         Display this message
  -o, --oh-my-zsh    Update Oh-My-Zsh along with ZSH config
EOF
}

die() {
    echo $1 >&2
    exit 1
}

ensure() {
    "$@" || die "command failed: $*"
}

update-zsh-config() {
    [[ -w "$ZDOTDIR" ]] || \
        die "The user doesn't have write permissions for the ZSH config directory"

    ensure cd $ZDOTDIR
    ensure git pull origin master
    if [[ "$1" = 1 ]]; then
        [[ -w "$ZSH" ]] || \
            die "The user doesn't have write permissions for the Oh-My-ZSH directory"

        ensure env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
    fi
}

update_omz=0

while (( $# > 0 )); do
    case $1 in
        (-h|--help)
            usage
            exit 0
            ;;
        (-o|--oh-my-zsh)
            update_omz=1
            ;;
        (*)
            die "Unknown option: $1"
            ;;
    esac
    shift
done

update-zsh-config $update_omz
