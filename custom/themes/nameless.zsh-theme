_is_ssh() {
    [[ "$(who am i)" =~ '\(([0-9]+\.?){4}\)$' ]]
}

_ssh_conn() {
if _is_ssh; then
    echo "%B%F{magenta}(ssh)%f%b "
  fi
}

_loc() {
    ##########################################################################################################
    #                                      username               hostname    directory                      #
    #                                          |                      |           |                          #
    #                                          V                      V           V                          #
    echo '%{%F{yellow}%}λ %(!.%B.%b)%F{yellow}%n%b%F{cyan}@%F{yellow}%m %F{green}%c %(?.%F{yellow}.%F{red})→ '
}

PROMPT='$(_ssh_conn)$(_loc)$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}λ %B%F{blue}git %F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%F{yellow} → %f"
