#!/bin/zsh
# Setup dotfiles (as symlink) in user's home directory.
# Create plugin directory for vim

function skipping_msg {
    echo $1 already exists, skipping
}

# glob with `*` does expand to all files in directory
# wrap in `(` and `)` to convert to array
FILES=(*[^setup.zsh\|README.md])

# array[@] return all items as seperate word,
# array[*] would return all items as one word
# add double quotes to avoid further parsing of filenames
for FILE in "${FILES[@]}"; do
    if [[ -a "$HOME/.$FILE" ]]; then
        skipping_msg $FILE
    else
        print "$FILE: Create symbolic link from $HOME/.$FILE to $(pwd)/$FILE"
        ln -s "$(pwd)/$FILE" "$HOME/.$FILE"
    fi
done

# create vim pack directory
VIM_START="$HOME/.vim/pack/$USER/start"
if [[ -a $VIM_START ]]; then
    skipping_msg $VIM_START
else
    git clone https://github.com/cormacrelf/vim-colors-github "$VIM_START/vim-colors-github"
fi
