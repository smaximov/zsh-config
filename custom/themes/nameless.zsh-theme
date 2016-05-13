ssh_connection() {
  if [[ -n $(who am i) ]]; then
    echo "%{$fg_bold[magenta]%}(ssh)%{$fg_no_bold[magenta]%} "
  fi
}

local user='%(!.%{$fg_bold[yellow]%}.%{$fg[yellow]%})%n%{$fg_no_bold[yellow]%}'
local host='%{$fg[yellow]%}%m'
local dir='%{$fg[green]%}%c'
local location="$user%{$fg[cyan]%}@$host $dir"

PROMPT="$(ssh_connection)%{$fg[yellow]%}λ $location %{$fg[yellow]%}→ $(git_prompt_info)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="λ %{$fg[blue]%}git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"
