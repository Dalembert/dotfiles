# Check if ssh agent has added ssh keys
ssh-add -l > /dev/null 2>&1
RET=$?
if [[ $RET != 0 ]]; then
    # Check if there exist ssh keys (files have to start with 'id')
    RET=`/home/dalembert/.ssh/id*[^.pub] > /dev/null 2>&1`
    if [[ $RET == 0 ]]
    then
        ssh-add ~/.ssh/id*[^.pub]
    fi
fi
