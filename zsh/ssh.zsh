NMBR_KEY=$(ssh-add -l | wc -l)
# TODO add all ssh keys beginning with `id`
if [[ $NMBR_KEY == 0 ]]; then
    ssh-add ~/.ssh/*
fi
