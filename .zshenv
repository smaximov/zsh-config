# -*- mode: sh; -*-

export EDITOR='emacsclient -t -a ""'
export PAGER='less -M'
export VISUAL=$EDITOR

export LC_ALL="ru_RU.UTF-8"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Emacs Cask integration
path+=($HOME/.cask/bin)

# Haskell Cabal & Stack integration
path+=($HOME/.local/bin $HOME/.cabal/bin)

# Rust Cargo integration
path+=($HOME/.cargo/bin)

# Node
path+=($HOME/node/bin)

# Rust sources for Racer
export RUST_SRC_PATH=$HOME/src/rust/src

# $HOME, sweet $HOME
path+=($HOME/bin)

export PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

# Store ZSH files under XDG_CONFIG_HOME base directory.
# This works by symlinking ~/.zshenv to ~/.config/zsh/.zshenv (this file).
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
