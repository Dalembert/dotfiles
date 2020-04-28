#!/bin/zsh
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/dalembert/.zshrc'

setopt appendhistory
setopt autocd
unsetopt beep
unsetopt nomatch

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

FILES=( $HOME/dotfiles/zsh/* )
for FILE in "${FILES[@]}"; do
    source $FILE
done

autoload -Uz compinit vcs_info && compinit
