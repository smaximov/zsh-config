# -*- mode: sh; -*-
PATH=$PATH:$HOME/bin:$HOME/opt/bin:/opt:$HOME/racket/bin:$HOME/google_appengine:$HOME/sbt/bin:$HOME/eclipse

export PATH=$PATH:$HOME/.cabal/bin
export PATH=/opt/ghc/head/bin:$PATH

export EDITOR='emacsclient -t -a ""'
export PAGER='less -M'
export VISUAL=$EDITOR

export LC_ALL="ru_RU.UTF-8"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export DROPBOX_APP_KEY="almb8hngcab8366"
export DROPBOX_APP_SECRET="jq4u626mloe2ubd"
export DROPBOX_ACCESS_TOKEN="hbtn9v46zdscf07"
export DROPBOX_ACCESS_TOKEN_SECRET="rz6l14e38sn6udd"
export DROPBOX_USER_ID="71350576"
export DROPBOX_ACCESS_TYPE="dropbox"

export GOROOT=$HOME/golang
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/gocode
export PATH="$PATH:$GOPATH/bin"

export POSTMARK_API_KEY=a36b37e9-8d16-48d5-8598-9aa4467d351b
export POSTMARK_SMTP_SERVER=smtp.postmarkapp.com
export POSTMARK_INBOUND_ADDRESS=e34279c2ecc5fdf16d244d544b290d2a@inbound.postmarkapp.com
export PATH="$HOME/.cask/bin:$PATH"

export ANDROID_HOME="$HOME/android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/build-tools:$ANDROID_HOME/platform-tools:$PATH"
