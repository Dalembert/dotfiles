#!/bin/zsh
# Setup dotfiles (as symlink) in user's home directory

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
        print Skipping $f
    else
        print "$f: Create symbolic link from $HOME/.$f to $(pwd)/$f"
        ln -s "$(pwd)/$f" "$HOME/.$f"
    fi
done

