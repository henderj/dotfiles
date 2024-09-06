#!/bin/bash

# Path to your dotfiles repository
dotfiles_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "dotfiles dir path: $dotfiles_path"

# Directories inside .config that you want to symlink
config_dirs=("nvim")

# Iterate over the files in the dotfiles repository
for file in $(ls -A $dotfiles_path); do
    # If the file is a dotfile
    if [[ $file == .* && $file != ".config" && $file != ".git" ]]; then
        echo "Do you want to replace $file? (y/n)"
        read answer
        # If the user confirms
        if [[ $answer == "y" ]]; then
            # Remove the existing dotfile from the home directory
            if [ -f ~/$file ]; then
              echo "$file exists. Overwriting it..."
              rm ~/$file
            fi
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

echo "Do you want to replace tmux.remote.conf? (y/n)"
read answer
if [[ $answer == "y" ]]; then
  rm ~/.tmux/tmux.remote.conf
  ln -s $dotfiles_path/tmux.remote.conf ~/.tmux/tmux.remote.conf
  echo "~/.tmux/tmux.remote.conf has been replaced with a symlink"
fi
