#!/bin/bash

# install plugins
nix-env -iA \
	nixpkgs.stow \
  nixpkgs.git \
  nixpkgs.tmux \
  nixpkgs.neovim \
  nixpkgs.tree \
  nixpkgs.fzf

# stow: -v=verbose -R=purge old links first ([R]estow) -t=target (where to install)
# --dotfiles=changes 'dot-' prefix in files to '.' (eg. dot-gitconfig -> .gitconfig)
stow --dotfiles -v -R -t ~ \
    git \
    nvim \
    tmux \
    vim
