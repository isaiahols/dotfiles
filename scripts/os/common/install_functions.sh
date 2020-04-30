#!/bin/bash

install_tmux() {
  ######################################################
  # tmux
  echo "Installing TMUX"
  $INSTALL_CMD tmux
}

install_convience() {
  #######################################################
  # Install bash_completion
  $INSTALL_CMD bash_completion

  #######################################################
  # cmatrix
  $INSTALL_CMD cmatrix

  ######################################################
  # helpers
  echo "Installing helper apps"
  $INSTALL_CMD htop
  $INSTALL_CMD wget 
  $INSTALL_CMD curl
  $INSTALL_CMD tree
  $INSTALL_CMD cmake

}

install_vscode() {
  echo "This has not been implemented for this OS."
}

install_go() {
  echo "This has not been implemented for this OS."
}

install_nodejs() {
  echo "This has not been implemented for this OS."
}