#!/bin/zsh
# Setup dotfiles (as symlink) in user's home directory.
# Create plugin directory for vim

function skipping_msg {
    echo "$1 already exists, skipping"
}

# glob with `*` does expand to all files in directory
# wrap in `(` and `)` to convert to array
FILES=(*[^setup.zsh\|README.md])

# array[@] return all items as seperate word,
# array[*] would return all items as one word
# add double quotes to avoid further parsing of filenames
for FILE in "${FILES[@]}"
do
    if [[ -a "$HOME/.$FILE" ]]
    then
        skipping_msg $FILE
    else
        print "$FILE: Create symbolic link from $HOME/.$FILE to $(pwd)/$FILE"
        ln -s "$(pwd)/$FILE" "$HOME/.$FILE"
    fi
done

# create vim pack directory
VIM_PACK="$HOME/.vim/pack/$USER/start"
if [[ -a $VIM_START ]]
then
    skipping_msg $VIM_PACK
else
    git clone https://github.com/cormacrelf/vim-colors-github "$VIM_PACK/vim-colors-github"
    git clone https://github.com/mattn/emmet-vim "$VIM_PACK/vim-emmet"
fi

# set git config
git config --global user.email "dalembert@pm.me"
git config --global user.name "Dalembert"
