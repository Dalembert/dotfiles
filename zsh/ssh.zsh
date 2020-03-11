# TODO trim white space from NMBR_KEY
# TODO ssh-add -l shows one line if no key is added, fix
NMBR_KEY=$(ssh-add -l | wc -l)
if [[ $NMBR_KEY == 0 ]]; then
    ssh-add ~/.ssh/*
fi
