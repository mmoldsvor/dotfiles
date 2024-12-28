# Dotfiles
Terminal configuration files

## Dependencies

* neovim >= 0.10.0
* tmux >= 3.5
* ripgrep (Optional with grep as fallback)

## Getting started

```shell
git clone --bare git@github.com:mmoldsvor/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
```
