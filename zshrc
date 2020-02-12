#!/bin/zsh
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/dalembert/.zshrc'

autoload -Uz compinit vcs_info && compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

setopt appendhistory
setopt autocd
unsetopt beep
unsetopt nomatch

if [[ $(uname -a) =~ "^Darwin" ]]; then
    # on an OSX system
    unalias -a
    alias .="source"
    alias ls="ls -G"
    alias ll="ls -lG"
    alias grep="grep --color"
else
    # assume on a Linux system
    unalias -a
    alias .="source"
    alias ls="ls --color=auto"
    alias ll="ls --color=auto -l"
    alias l.="ls -d .*"
    alias rm="rm -i"
    alias mv="mv -i"
    alias cp="cp -i"
    alias grep="grep --color"
    alias motd="sudo /usr/sbin/update-motd"
    alias emotd="sudo vim /etc/update-motd.d/10-todos"
fi

# git aliases
alias glog="git log --all --graph --oneline"
alias gbranch="git branch --list -a"

ZSHRC=~/.zshrc
export ZSHRC
VIMRC=~/.vimrc
export VIMRC
GIT_EDITOR=vim
export GIT_EDITOR

NMBR_KEY=$(ssh-add -l | wc -l)
# TODO add all ssh keys beginning with `id`
if [[ $NMBR_KEY == 0 ]]; then
    ssh-add ~/.ssh/id_ecdsa
fi

setopt promptsubst
function precmd_vcs_info { vcs_info }
precmd_functions+=( precmd_vcs_info )
PROMPT='%B%F{white}%c%f%b${vcs_info_msg_0_} '
# only output git branch in orange
zstyle ":vcs_info:*" formats ":%F{172}%b%f"
