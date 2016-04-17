My ZSH configuration based on [Oh My Zsh](http://ohmyz.sh/). It's based on (and tries to enforce) the
following assumptions.

* `XDG_*` variables are set according to [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html):

  | Variable          | Value            |
  | ----------------- | ---------------- |
  | `XDG_CONFIG_HOME` | `~/.config`      |
  | `XDG_DATA_HOME`   | `~/.local/share` |
  | `XDG_CACHE_HOME`  | `~/.cache`       |

* Some additional variables are set:

  | Variable          | Value                      |
  | ----------------- | -------------------------- |
  | `ZDOTDIR`         | `$XDG_CONFIG_HOME/zsh`     |
  | `ZSH`             | `$XDG_DATA_HOME/oh-my-zsh` |
  | `ZSH_CACHE_DIR`   | `$XDG_CACHE_HOME/zsh`      |
* ZSH config files located under `$ZDOTDIR`.
* Oh My Zsh files located under `$ZSH`;
* `~/.zshenv` is a symbolic link pointing to `$ZDOTDIR/.zshenv`.

# Getting started

Run the following script (it will prompt for sudo password):

``` bash
$ curl -sSf https://raw.githubusercontent.com/smaximov/zsh-config/master/tools/install.sh | sh
```

...or install manually (**Note**: precise locations matter!):

``` bash
# Clone this repository
$ git clone git@github.com:smaximov/zsh-config.git ~/.config/zsh
# Clone Oh My Zsh:
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.local/share/oh-my-zsh
# Add a symbolic link to .zshenv
$ ln -s $(readlink -e ~/.config/zsh/.zshenv) ~/.zshenv
```

Then you should change your shell:

``` bash
$ sudo chsh -s /usr/bin/zsh $USER
```
