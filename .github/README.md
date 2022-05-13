# Dotfiles
Linux configuration files

## Dependencies

* zsh >= 5.8.1
* neovim >= 7.0
* ripgrep

## How to use

```shell
git clone --bare git@github.com:mmoldsvor/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
chsh -s $(which zsh)
source $HOME/.zshrc
config config --local status.showUntrackedFiles no
```

Inside nvim install plugins

```shell
:PlugInstall
```
