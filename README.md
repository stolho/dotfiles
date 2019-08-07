# My dotfiles
Various dotfiles:
* bash_profile
* bashrc
* tmux_conf
* vimrc


## vim

### macOS
Vim on maOS is installed using brew with python 3 and lua support.

Due to this [issue](https://www.reddit.com/r/vim/comments/8iymh8/vim_in_osx_with_python3_support/dyx1b94/) to install vim properly run this:

```bash
$ brew uninstall vim
$ brew remove vim
$ brew cleanup
$ alias python=python3
$ brew install vim
```

After this you can run `$ vim --version` and check if it has `+python3`. If yes, you can unalias the python alias by running:
```bash
$ unalias python
```

