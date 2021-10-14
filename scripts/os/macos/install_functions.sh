#!/bin/bash
install_python() {
  echo
  echo    "*************************************"
  read -p "Do you want to install Anaconda? Y/n " -n 1 -r
  echo    "*************************************"
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing $ANACONDA3"
    pushd .
    cd /tmp
    curl -O https://repo.anaconda.com/archive/$ANACONDA3
    chmod 755 $ANACONDA3
    ./$ANACONDA3
    sudo ln -s ~/anaconda3/bin/python /usr/bin/python
    popd
  else
    #######################################################
    # Get python 2 & 3 dev
    # sudo apt -y install software-properties-common python-software-properties
    # sudo apt update
    # sudo apt -y install python3.6-dev
    # sudo apt -y install python2.7-dev
    $INSTALL_CMD python3
  fi
}

install_ruby() {
  echo
  echo    "*********************************"
  read -p "Do you want to install ruby? Y/n " -n 1 -r
  echo    "*********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  curl -sSL https://get.rvm.io | bash -s stable --ruby
}

install_vim() {
  echo
  echo    "********************************"
  read -p "Do you want to install VIM? Y/n " -n 1 -r
  echo    "********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi

  $INSTALL_CMD vim

  # Install Vundle
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  ######################################################
  # YouCompleteMe setup
  pushd .
  cd ~/.vim/bundle/
  git clone https://github.com/Valloric/YouCompleteMe.git
  cd YouCompleteMe
  git submodule update --init --recursive
  python install.py --clang-completer --go-completer
  popd

}

install_react_native_tools() {
  echo
  echo    "********************************"
  read -p "Do you want to install React Native Tools? Y/n " -n 1 -r
  echo    "********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  
  # RN stuff
  $INSTALL_CMD watchman
  $INSTALL_CMD --cask adoptopenjdk/openjdk/adoptopenjdk8 
  sudo gem install cocoapods
  # Debugger
  $INSTALL_CMD --cask react-native-debugger
}