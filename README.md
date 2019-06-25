# My dotfiles
Various dotfiles:
* bash_profile
* bashrc
* tmux_conf
* vimrc


## vim

### macOS
Vim on maOS is installed using brew with python 3 and lua support.

To install vim properly run this:

```bash
$ brew uninstall vim
$ brew remove vim
$ brew cleanup
$ brew install vim --with-python3 --with-lua --with-luajit
```
