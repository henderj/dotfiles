#!/bin/bash

# Path to your dotfiles repository
dotfiles_path="."

# Directories inside .config that you want to symlink
config_dirs=("nvim")

# Iterate over the files in the dotfiles repository
for file in $(ls -A $dotfiles_path); do
    # If the file is a dotfile
    if [[ $file == .* && $file != ".config" ]]; then
        echo "Do you want to replace $file? (y/n)"
        read answer
        # If the user confirms
        if [[ $answer == "y" ]]; then
            # Remove the existing dotfile from the home directory
            rm ~/$file
            # Create a symlink to the dotfile in the repo
            ln -s $dotfiles_path/$file ~/$file
            echo "$file has been replaced with a symlink."
        fi
    fi
done

# Handle the .config directory separately
for dir in "${config_dirs[@]}"; do
    echo "Do you want to replace .config/$dir? (y/n)"
    read answer
    # If the user confirms
    if [[ $answer == "y" ]]; then
        # Remove the existing directory from the .config directory
        rm -r ~/.config/$dir
        # Create a symlink to the directory in the repo
        ln -s $dotfiles_path/.config/$dir ~/.config/$dir
        echo ".config/$dir has been replaced with a symlink."
    fi
done
