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

FILES=( $HOME/dotfiles/zsh/* )
<<<<<<< HEAD
>>>>>>> 4895a78... Consistent naming
=======
>>>>>>> 7c7a179... Resovled merge confilct
for FILE in "${FILES[@]}"; do
    source $FILE
done
