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
    printf "$fg_bold[red]%s${reset_color}\n" $1 >&2
    exit 1
}

info() {
    printf "$fg[blue]%s${reset_color}\n" $1
}

success() {
    printf "$fg_bold[green]%s${reset_color}\n" $1
}

ensure() {
    "$@" || die "command failed: $*"
}

update-zsh-config() {
    info "Running ZSH config update..."

    [[ -w "$ZDOTDIR" ]] || \
        die "The user doesn't have write permissions for the ZSH config directory"

    ensure cd $ZDOTDIR
    ensure git pull origin master

    success "ZSH config has been updated. Latest commit:"
    git --no-pager log -1 --oneline

    if [[ -w "$ZSH_CACHE_DIR" ]]; then
        touch $ZSH_CACHE_DIR/last-update
    fi

    if (( $1 == 1 )); then
        [[ -w "$ZSH" ]] || \
            die "The user doesn't have write permissions for the Oh-My-ZSH directory"

        ensure env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
    fi

    info "To apply the changes, type either of the following:"
    success "$ exec -l zsh"
    info "    to replace the current shell instance"
    info "    (all background jobs will be killed)"
    success "$ env zsh"
    info "    to start a new shell instance"
    info "You can also logout and login again"
}

main() {
    autoload -Uz colors && colors

    local update_omz=0

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
}

main "$@" || exit 0
