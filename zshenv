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

# $HOME, sweet $HOME
path+=($HOME/bin)

export PATH
