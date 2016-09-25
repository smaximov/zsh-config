# -*- mode: sh; -*-

ZSH=$XDG_DATA_HOME/oh-my-zsh

# Custom directory location
ZSH_CUSTOM=$ZDOTDIR/custom
ZSH_THEME="nameless"

# update every 7 days by default
UPDATE_INTERVAL_DAYS=7

# Plugins
plugins=(git extract ruby cake bundler coffee npm pip scala)

# Create ZSH cache directory unless it already exists
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR

# Custom enviroment variables
[[ -f $ZDOTDIR/custom.env ]] && source $ZDOTDIR/custom.env

# Disable fancy colored shell prompts and auto-update on dumb terminals
if [ $TERM = "dumb" ]; then
   unsetopt zle
   PS1="$ "
   DISABLE_AUTO_UPDATE=true
fi

source $ZSH/oh-my-zsh.sh

for file in $ZDOTDIR/lib/*.zsh; do
    source $file
done
