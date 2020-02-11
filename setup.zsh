#!/bin/zsh
# Setup dotfiles (as symlink) in user's home directory.
# Create plugin directory for vim

function skipping_msg {
    echo $1 already exists, skipping
}

# glob with `*` does expand to all files in directory
# wrap in `(` and `)` to convert to array
<<<<<<< HEAD
FILES=(*[^setup.zsh\|README.md])
=======
FILES=(*[^setup.zsh^README.md])
>>>>>>> 81ab246... Exclude README file from getting symlinked

# array[@] return all items as seperate word,
# array[*] would return all items as one word
# add double quotes to avoid further parsing of filenames
for f in "${FILES[@]}"
do
    if [[ -a "$HOME/.$f" ]]; then
        skipping_msg $f
    else
        print "$f: Create symbolic link from $HOME/.$f to $(pwd)/$f"
        ln -s "$(pwd)/$f" "$HOME/.$f"
    fi
done

# create vim pack directory
VIM_START="$HOME/.vim/pack/$USER/start"
if [[ -a $VIM_START ]]; then
    skipping_msg $VIM_START
else
    git clone https://github.com/cormacrelf/vim-colors-github $VIM_START
fi
