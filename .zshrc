# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/martin/.zshrc'

setopt promptsubst

source ~/.zsh_config/themes/agnoster.zsh-theme

ZSH_THEME='agnoster'

EDITOR='vim'


# Bind movement keys
source ~/.zsh_config/keybinds.zsh

source ~/.zsh_config/aliases.zsh

# Set ls colors
source /usr/share/LS_COLORS/dircolors.sh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

unsetopt listambiguous
autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch
