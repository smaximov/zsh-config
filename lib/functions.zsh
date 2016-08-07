# Usage: yes-no [-y|-n] prompt...
# Options
#     -y    assume `yes' as the default answer [default]
#     -n    assume `no` as the default anwwer
yes-no() {
    local hint reply default opt
    default=y

    while getopts :yn opt; do
        case $opt in
            (y)
                default=y
                ;;
            (n)
                default=n
                ;;
            (\?)
                echo "Unknown option: -${OPTARG}"
                ;;
        esac
    done

    if [[ $default == y ]]; then
        hint="$fg[green]Y${reset_color}/n"
    else
        hint="y/$fg[green]N${reset_color}"
    fi

    (( OPTIND > 1 )) && shift $(( OPTIND - 1 ))

    read -k 1 "reply?$* [${hint}] "

    case $reply in
        (y|Y|n|N)
            echo
            ;;
        ($'\n')
            reply=$default
            ;;
        (*)
            echo
            reply=$default
            ;;
    esac

    case $reply in
        y|Y)
            return 0
            ;;
        n|N)
            return 1
            ;;
        *)
            # unreachable
            exit 1
            ;;
    esac
}

update-zsh-config() {
    env ZSH=$ZSH $ZDOTDIR/tools/update-zsh-config.sh "$@"
}

auto-update-enabled() {
    return ${+DISABLE_AUTO_UPDATE}
}

time-to-update() {
    local update_interval=$(( $UPDATE_INTERVAL_DAYS * 24 * 60 * 60 ))
    local current_time=$(date +%s)
    local last_update_time=$(stat -c %Z $ZSH_CACHE_DIR/last-update)

    return $(( ($current_time - $last_update_time) < $update_interval ))
}

check-for-update() {
    local zsh="$fg[cyan]ZSH config${reset_color}"
    local scheduled="$zsh: last update was more than ${UPDATE_INTERVAL_DAYS} days ago; check for updates?"
    local first_time="$zsh: the date of the last update is unknown; check for updates?"

    if [[ -f $ZSH_CACHE_DIR/last-update ]]; then
        if time-to-update && yes-no $scheduled; then
            update-zsh-config
        fi
    elif yes-no $first_time; then
        update-zsh-config
    fi
}

with-path() {
    env PATH="$1:${PATH}" "${@:2}"
}
