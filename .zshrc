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
[[ -f $ZDOTDIR/custom.zshrc ]] && source $ZDOTDIR/custom.zshrc

# Disable fancy colored shell prompts and auto-update on dumb terminals
if [ $TERM = "dumb" ]; then
   unsetopt zle
   PS1="$ "
   DISABLE_AUTO_UPDATE=true
fi

source $ZSH/oh-my-zsh.sh

for file in $ZDOTDIR/lib/*.zsh; do
    source "$file"
done

# Include machine-specific and private configuration

# NOTE(smaximov):
#   (.N) specifies glog qualifiers; "." (dot) stands for regular files, "N" (NULL_GLOB)
#   makes Zsh not complain if the glob doesn't match anything.
for file in $ZDOTDIR/local/*.zsh(.N); do
    source "$file"
done

# Since /etc/zshrc is read after $ZDOTDIR/.zshenv, the NIX_PATH setting defined in the former override settings
# defined in the latter, so we customize NIX_PATH here instead.
[[ -d "$HOME/.nix-defexpr/channels" ]] && export NIX_PATH="$HOME/.nix-defexpr/channels${NIX_PATH:+:$NIX_PATH}"
