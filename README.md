My ZSH configuration based on [Oh My Zsh](http://ohmyz.sh/).

# Getting started

Run following script (it will prompt for your password once):

``` bash
$ curl -sSf https://raw.githubusercontent.com/smaximov/zsh-config/master/tools/install.sh | sh
```

...or install manually:

``` bash
# Clone this repository
$ git clone git@github.com:smaximov/zsh-config.git ~/.config/zsh
# Clone Oh My Zsh:
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.local/share/oh-my-zsh
# Add a symbolic link to .zshenv
$ ln -s $(readlink -e ~/.config/zsh/.zshenv) ~/.zshenv
```

Then change your shell if necessary.

**Note**: presice locations matters!
