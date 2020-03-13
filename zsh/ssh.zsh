ssh-add -l > /dev/null 2>&1
if [[ $? != 0 ]]; then
    ssh-add ~/.ssh/id*[^.pub]
fi
