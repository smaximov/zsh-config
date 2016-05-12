#!/usr/bin/zsh

set -u

usage() {
    cat <<EOF
Usage: update_zsh_config [-h|--help] [--o|--oh-my-zsh]
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

update_zsh_config() {
    ensure cd $ZDOTDIR
    ensure git pull origin master
    if [[ "$1" = 1 ]]; then
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

update_zsh_config $update_omz
