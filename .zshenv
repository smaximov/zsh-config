# -*- mode: sh; -*-

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

unset ALTERNATE_EDITOR
export EDITOR='emacsclient -t'
export PAGER='less -M'
export VISUAL=$EDITOR

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Haskell Cabal & Stack integration
path+=($HOME/.local/bin $HOME/.cabal/bin)

# Rust setup
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export RUSTUP_HOME=$XDG_CACHE_HOME/rustup
path+=($CARGO_HOME/bin)

# New fancy error output format for rust-nightly
export RUST_NEW_ERROR_FORMAT=true

# Rust sources for Racer
export RUST_SRC_PATH=$HOME/src/rust/src

# Node
path+=($HOME/node/bin)

# $HOME, sweet $HOME
export PATH

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export HISTFILE=$ZSH_CACHE_DIR/zhistory

# StarDict dictionaries location
export STARDICT_DATA_DIR=$HOME/.local/share/stardict/dic

# Some SDL games don't handle multiple display correctly in fullscreen
export SDL_VIDEO_FULLSCREEN_DISPLAY=0

# Store ZSH files under XDG_CONFIG_HOME base directory.
# This works by symlinking ~/.zshenv to ~/.config/zsh/.zshenv (this file).
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
