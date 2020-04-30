#!/bin/bash
#######################################################
# Latest GCC && G++
sudo apt update && sudo apt dist-upgrade

#######################################################
# build tools
$INSTALL_CMD build-essential

######################################################
# helpers
$INSTALL_CMD tar

# install_lua()
# install_perl()
# install_x11()
# install_atk()
#######################################################
  # Lua perl xpm x11 atk
  # $INSTALL_CMD liblua5.1-dev luajit libluajit-5.1 libperl-dev libatk1.0-dev libx11-dev libxpm-dev
  # sudo ln -s /usr/bin/luajit /usr/bin/lua

# For VIM
$INSTALL_CMD checkinstall

#######################################################
# ctags
$INSTALL_CMD exuberant-ctags