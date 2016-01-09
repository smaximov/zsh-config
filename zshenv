# -*- mode: sh; -*-
PATH=$PATH:$HOME/bin:$HOME/opt/bin:/opt:$HOME/racket/bin:$HOME/google_appengine:$HOME/sbt/bin:$HOME/eclipse

export PATH=$HOME/.cabal/bin:$PATH
export PATH=/opt/ghc/head/bin:$PATH

export EDITOR='emacsclient -t -a ""'
export PAGER='less -M'
export VISUAL=$EDITOR

export LC_ALL="ru_RU.UTF-8"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export PATH="$HOME/.cask/bin:$PATH"

export ANDROID_HOME="$HOME/android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/build-tools:$ANDROID_HOME/platform-tools:$PATH"

export PATH=$HOME/.local/bin:$PATH
