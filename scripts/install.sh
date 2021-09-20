#!/bin/bash
# TODO make functions that are loaded from the specific OS file that get called to install this stuff

INSTALL_CMD=""
UNINSTALL_CMD=""
LIBRARY_EXTRA=""
source ./os/common/install_functions.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing MAC environment!!"
  source ./os/macos/os_specific_vars.sh
  source ./os/macos/install_functions.sh
  source ./os/macos/install.sh
else
  echo "***********************************"
  echo "* Installing Ubuntu environment!! *"
  echo "***********************************"
  source ./os/ubuntu/os_specific_vars.sh
  source ./os/ubuntu/install_functions.sh
  source ./os/ubuntu/install.sh
fi

install_convience
install_python
install_go
install_nodejs
install_ruby
install_vim
install_vscode
# install_conan

#######################################################
# libevent 2.x
# $INSTALL_CMD libevent$LIBRARY_EXTRA

#######################################################
# # ncurses
# $INSTALL_CMD libncurses5$LIBRARY_EXTRA
# $INSTALL_CMD libncursesw5$LIBRARY_EXTRA


echo "Finished setting up environment"

