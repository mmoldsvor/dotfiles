# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

setopt promptsubst

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

EDITOR='vim'


# Bind movement keys
source ~/.config/.zsh_config/keybinds.zsh

source ~/.config/.zsh_config/aliases.zsh

# Set ls colors
source /usr/share/LS_COLORS/dircolors.sh
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Autocomplete
unsetopt listambiguous
autoload -Uz compinit
compinit # End of lines added by compinstall
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1 

# vi keybinds for tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit command with vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
