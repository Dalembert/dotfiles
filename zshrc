#!/bin/zsh
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/dalembert/.zshrc'

autoload -Uz compinit vcs_info && compinit

setopt appendhistory
setopt autocd
unsetopt beep
unsetopt nomatch

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

ZSHRC=~/.zshrc
export ZSHRC
VIMRC=~/.vimrc
export VIMRC
GIT_EDITOR=vim
export GIT_EDITOR

for FILE in zsh/*.zsh; do
    echo "Source $FILE"
    source $FILE
done
