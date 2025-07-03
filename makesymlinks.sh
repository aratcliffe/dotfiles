#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"

for file in .[^.]*; do
    if [ "$file" != ".git" ] ; then

        # If file is not a symlink move to the backup dir
        if [ ! -L "${HOME}/$file" ] ; then
            mv ~/$file ~/dotfiles_old/
        fi
        
        echo "Creating symlink to $file in home directory."
        ln -sf $dir/$file ~/$file
    fi
done
