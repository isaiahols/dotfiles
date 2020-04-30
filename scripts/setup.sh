#!/bin/bash 

# Get current dir (so run this script from anywhere) 
export DOTFILES_DIR EXTRA_DIR 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
EXTRA_DIR="$HOME/.extra" 


# Update dotfiles itself first 
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master 

# Bunch of symlinks 
ln -sfv "$DOTFILES_DIR/../profiles/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/../profiles/.inputrc" ~
ln -sfv "$DOTFILES_DIR/../profiles/.vimrc" ~
ln -sfv "$DOTFILES_DIR/../profiles/.tern-config" ~
ln -sfv "$DOTFILES_DIR/../profiles/.sqliterc" ~
ln -sfv "$DOTFILES_DIR/../vim/" "$HOME/.vim"
ln -sfv "$DOTFILES_DIR/../git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/../git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/../system/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/../system/.tmux.conf.local" ~
#ln -sfv "$DOTFILES_DIR/profiles/.gdbinit" ~

# Package managers & packages 
#. "$DOTFILES_DIR/install/npm.sh" 
#. "$DOTFILES_DIR/install/pip.sh" 


# Install extra stuff 
if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then 
  . "$EXTRA_DIR/install.sh" 
fi 

