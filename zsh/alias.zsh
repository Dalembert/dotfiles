if [[ `uname -a` =~ "^Darwin" ]]; then
    # on an OSX system
    unalias -a
    alias .="source"
    alias ls="ls -G"
    alias ll="ls -lG"
    alias grep="grep --color"
else
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
alias glog="git log --all --graph --oneline"
alias gbranch="git branch --list -a"
