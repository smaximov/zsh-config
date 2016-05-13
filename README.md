# My ZSH config

My ZSH configuration utilizing [Oh My Zsh](http://ohmyz.sh/).

# Getting started

The configuration is based on (and tries to enforce) the
following assumptions.

* `XDG_*` variables are set according to
  [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html):
  + `XDG_CONFIG_HOME`: `~/.config`
  + `XDG_DATA_HOME`: `~/.local/share`
  + `XDG_CACHE_HOME`: `~/.cache`
* Some additional variables are set:
  + `ZDOTDIR`: `$XDG_CONFIG_HOME/zsh`
  + `ZSH`: `$XDG_DATA_HOME/oh-my-zsh`
  + `ZSH_CACHE_DIR`: `$XDG_CACHE_HOME/zsh`
* ZSH config files located under `$ZDOTDIR`.
* Oh My Zsh files located under `$ZSH`.
* `~/.zshenv` is a symbolic link pointing to `$ZDOTDIR/.zshenv`.

## Custom environment variables

To set custom (i.e., user- or machine-specific) environment variables or
to override the defaults, use the file `$ZDOTDIR/custom.env`.

The following variables can be used to customize this configuration:

| Variable | Default value | Description |
|----------|---------|-------------|
| `UPDATE_INTERVAL_DAYS` | `7` | How often (in days) to check for updates? |
| `DISABLE_AUTO_UPDATE` | _unset_ | Set this variable to some value to disable auto updating |

# Installation

Run the following script (it will prompt for sudo password):

``` bash
$ curl -sSf https://raw.githubusercontent.com/smaximov/zsh-config/master/tools/install.sh | sh
```

...or install the config manually (**Note**: precise locations matter!):

``` bash
# Clone this repository
$ git clone git@github.com:smaximov/zsh-config.git ~/.config/zsh
# Clone Oh My Zsh:
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.local/share/oh-my-zsh
# Add a symbolic link to .zshenv
$ ln -s $(readlink -e ~/.config/zsh/.zshenv) ~/.zshenv
```

Finally, you can change your shell:

``` bash
$ sudo chsh -s /usr/bin/zsh $USER
```

# Updating

ZSH will attempt to update the configuration after login every
`$UPDATE_INTERVAL_DAYS` days (7 by default).
You can override this variable in `$ZDOTDIR/custom.env`.
Alternatively, you can disable auto-updating entirely by
setting the `DISABLE_AUTO_UPDATE` variable to some value (e.g., `DISABLE_AUTO_UPDATE=yes`).

To update the configuration manually, run `update-zsh-config`.
