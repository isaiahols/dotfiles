#!/bin/bash

#Get all of the relevant files

# git
GIT_FILES=$(find ~/.dotfiles/git -type f)
#echo $GIT_FILES

# install
INSTALL=$(find ~/.dotfiles/install -type f)
#echo $INSTALL

# profiles
PROFILES=$(find ~/.dotfiles/profiles -type f)
#echo $PROFILES

#scripts
SCRIPTS=$(find ~/.dotfiles/scripts -type f)
#echo $SCRIPTS

# system
SYSTEM=$(find ~/.dotfiles/system -type f)
#echo $SYSTEM

#vim
VIM_AUTO=$(find ~/.dotfiles/vim/autoload -type f)
VIM_COLORS=$(find ~/.dotfiles/vim/colors -type f)
VIM_CONFIG=$(find ~/.dotfiles/vim/config -type f)
VIM="${VIM_AUTO} ${VIM_COLORS} ${VIM_CONFIG}"
#echo $VIM


# All of the files
FILES="${GIT_FILES} ${INSTALL} ${PROFILES} ${SCRIPTS} ${SYSTEM} ${VIM}"
#echo $FILES

#tar up all of the files
tar -czf - ${FILES} | split --bytes=15m --suffix-length=4 --numeric-suffix - files.tar.gz.
