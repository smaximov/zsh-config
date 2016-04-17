# -*- mode: sh; -*-

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -t'
export PAGER='less -M'
export VISUAL=$EDITOR

export LC_ALL="ru_RU.UTF-8"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Haskell Cabal & Stack integration
path+=($HOME/.local/bin $HOME/.cabal/bin)

# Rust setup
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export RUSTUP_HOME=$XDG_CACHE_HOME/rustup
path+=($CARGO_HOME/bin)

# Node
path+=($HOME/node/bin)

# Rust sources for Racer
export RUST_SRC_PATH=$HOME/src/rust/src

# $HOME, sweet $HOME
path+=($HOME/bin)

export PATH

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export HISTFILE=$ZSH_CACHE_DIR/zhistory

# Store ZSH files under XDG_CONFIG_HOME base directory.
# This works by symlinking ~/.zshenv to ~/.config/zsh/.zshenv (this file).
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
