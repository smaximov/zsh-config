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

    if (( $2 == 0 )); then
        info "Respawning zsh..."
        if [[ -n "$(jobs)" ]] && ! yes-no "You have background jobs running. Proceed?"; then
            warn "Aborted"
            return 0
        fi

        exec -l zsh
    fi
}

main() {
    autoload -Uz colors && colors

    local update_omz=0
    local norespawn=0

    while (( $# > 0 )); do
        case $1 in
            (-h|--help)
                usage
                exit 0
                ;;
            (-o|--oh-my-zsh)
                update_omz=1
                ;;
            (--no-respawn)
                norespawn=1
                ;;
            (*)
                die "Unknown option: $1"
                ;;
        esac
        shift
    done

    update-zsh-config $update_omz $norespawn
}

main "$@" || exit 0
