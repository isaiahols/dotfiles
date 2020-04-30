#!/bin/bash
install_go() {
  echo
  echo    "***********************************"
  read -p "Do you want to install golang? Y/n " -n 1 -r
  echo    "***********************************"
  echo # This moves to a new line
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  pushd .
  cd /tmp
  mkdir go_download
  cd go_download
  curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
  tar xvf go1.6.linux-amd64.tar.gz
  sudo chown -R root:root ./go
  sudo mv go /usr/local
  popd
  rm -rf /tmp/go_download

  echo "Make sure that the paths are in your profile."
  echo 'GOPATH=$HOME/work'
  echo 'PATH=$PATH:/usr/local/go/bin:$GOPATH/bin'
}

install_nodejs() {
  echo
  echo    "***********************************"
  read -p "Do you want to install nodejs? Y/n " -n 1 -r
  echo    "***********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  pushd .
  cd /tmp
  curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
  sudo bash nodesource_setup.sh
  popd
  rm tmp/nodesource_setup.sh
  # sudo apt -y install nodejs
}

install_python() {
  echo
  echo    "**************************************"
  read -p "Do you want to install Anaconda? Y/n  " -n 1 -r
  echo    "**************************************"
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
    $INSTALL_CMD python3-dev
    $INSTALL_CMD python-dev
  fi
}

install_ruby() {
  echo
  echo    "**********************************"
  read -p "Do you want to install ruby? Y/n  " -n 1 -r
  echo    "**********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  $INSTALL_CMD software-properties-common
  sudo apt-add-repository -y ppa:rael-gc/rvm
  sudo apt-get update
  sudo apt-get install rvm
  rvm install ruby
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
  #######################################################
  # vim
  echo "Installing VIM"
  # Uninstall
  # install_vim
  $UNINSTALL_CMD vim vim-runtime vim-gnome vim-tiny vim-gui-common
  sudo rm -rf /usr/local/share/vim /usr/bin/vim

  # git vim
  pushd .
  cd /tmp
  git clone https://github.com/vim/vim
  cd vim
  git pull && git fetch

  # build vim
  # configure
  ./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --with-python3-command=python3 \
    --enable-python3interp \
    --enable-cscope \
    --enable-gui=auto \
    --with-features=huge \
    --enable-fontset \
    --enable-largefile \
    --with-compiledby="$USER" \
    # --enable-luainterp \
    # --with-x \
    --enable-rubyinterp=dynamic \
    --with-ruby-command=/usr/bin/ruby \
    --enable-pythoninterp=dynamic \
    # --with-python-config-dir=/usr/lib

  make
  sudo make install

  # remove vim source
  cd ..
  rm -rf vim
  popd

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

install_vscode() {
  echo
  echo    "***********************************************"
  read -p "Do you want to install Visual Studio Code? Y/n " -n 1 -r
  echo    "***********************************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  $INSTALL_CMD software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  $INSTALL_CMD code
}

install_conan() {
  echo
  echo    "**********************************"
  read -p "Do you want to install conan? Y/n " -n 1 -r
  echo    "**********************************"
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return
  fi
  pip3 install conan
}