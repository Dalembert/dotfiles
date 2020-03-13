ssh-add -l > /dev/null 2>&1
RET=$?
if [[ $RET != 0 ]]; then
    ssh-add ~/.ssh/id*[^.pub]
fi
