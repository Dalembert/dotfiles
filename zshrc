zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/dalembert/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

setopt +o nomatch
setopt appendhistory autocd
unsetopt beep

PROMPT="%B%F{white}%c%f%b "

alias ls="ls --color=auto"
alias ll="ls --color=auto -lAhtr"
alias l.="ls .* -d"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias .="source"
alias ..="cd .."
alias motd="sudo /usr/sbin/update-motd"
alias emotd="sudo vim /etc/update-motd.d/10-todos"

# git aliases
alias glog="git log --all --graph --oneline"
alias gbranch="git branch --list -a"

ZSHRC=~/.zshrc
VIMRC=~/.vimrc
export ZSHRC
export VIMRC

NMBR_KEY=$(ssh-add -l | wc -l)
if [[ $NMBR_KEY == 0 ]]; then
    ssh-add ~/.ssh/id_ecdsa
fi

