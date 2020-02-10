#!/bin/zsh
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/dalembert/.zshrc'

autoload -Uz compinit vcs_info
compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

setopt +o nomatch
setopt appendhistory autocd
unsetopt beep

if [[ $(uname -a) =~ "^Darwin" ]]; then
    # on an OSX system
    unalias -a
    alias .="source"
    alias ..="cd .."
    alias ls="ls -G"
    alias grep="grep --color"
else
    # assume on a Linux system
    unalias -a
    alias .="source"
    alias ..="cd .."
    alias ls="ls --color=auto"
    alias ll="ls --color=auto -lAhtr"
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

function git_prompt {
    vcs_info
    echo $vcs_info_msg_0_ | grep -o "\[.*\]"
}
precmd_functions+=( git_prompt )
git_prompt

setopt prompt_subst

PROMPT="%B%F{white}%c%f%b $git_prompt"
