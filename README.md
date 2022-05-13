# Dotfiles
Linux configuration files

## Dependencies

* neovim >= 7.0
* ripgrep

## How to use

```shell
git clone --bare git@github.com:mmoldsvor/dotfiles.git .dotfiles
/usr/bin/git --git-dir=.dotfiles --work-tree=$HOME checkout
config config --local status.showUntrackedFiles no
```
