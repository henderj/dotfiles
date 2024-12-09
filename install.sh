#!/bin/bash

# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
source ~/.nix-profile/etc/profile.d/nix.sh

# install plugins
nix-env -iA \
	nixpkgs.stow \
  nixpkgs.git \
  nixpkgs.tmux \
  nixpkgs.neovim \
  nixpkgs.tree \
  nixpkgs.fzf

# create these dirs if they don't already exist
# this prevents stow from symlinking these and will instead symlink child dirs and files
mkdir -p ~/.config ~/.tmux

# stow: -v=verbose -R=purge old links first ([R]estow) -t=target (where to install)
# --dotfiles=changes 'dot-' prefix in files to '.' (eg. dot-gitconfig -> .gitconfig)
stow --dotfiles -v -R -t ~ \
    git \
    nvim \
    tmux \
    vim

bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
