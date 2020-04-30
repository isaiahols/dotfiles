#!/bin/bash
#
# This script compiles and install tmux 2.0 with libevent 2.0.22 and ncurses
# 6.0 into your ~/local/ directory so that you can find the "tmux" executable
# under ~/local/bin/ later.  This script will create a directory ~/.tmux.tmp/
# to put some intermediate temporary files, which you can delete after the
# installation finishes.
#
# 2015/08/23
#



# Exit this script when some command has a nonzero exit code

set -e
trap 'echo "Non-zero exit status at line $LINENO in $BASH_SOURCE"' ERR


# Change directory to ~/.tmux.tmp

mkdir -p -m 0700 `pwd`/tmux.tmp
cd `pwd`/tmux.tmp

# Download libevent, ncurses, and tmux

if [ ! -f libevent-2.0.22-stable.tar.gz ]; then
    wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
    echo
    echo "Missing: libevent-2.0.22-stable.tar.gz"
    echo "Download: https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz"
    echo
fi

if [ ! -f ncurses-6.0.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
    echo
    echo "Missing: ncurses-6.0.tar.gz" 
    echo "Download: https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz"
    echo
fi

if [ ! -f tmux-2.0.tar.gz ]; then
    wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
    echo
    echo "Missing: tmux-2.0.tar.gz" 
    echo "Download: https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz"
    echo
fi

# Check the integrity of the downloaded files

check_sha256() {
    digest=$1 file=$2
      [[ $( openssl dgst -sha256 "$file" ) =~ $digest ]]
    }

check_sha256 71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3 \
                   libevent-2.0.22-stable.tar.gz

check_sha256 f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260 \
                   ncurses-6.0.tar.gz

check_sha256 795f4b4446b0ea968b9201c25e8c1ef8a6ade710ebca4657dd879c35916ad362 \
                   tmux-2.0.tar.gz


# Compile and install libevent to ~/local

if [[ ! -f ~/local/include/event.h ]]; then
    tar -xzf libevent-2.0.22-stable.tar.gz
    echo 'Making libevent'
    cd libevent-2.0.22-stable
    ./configure --prefix="$HOME/local"
    make
    make install
    cd ..
    echo 'Finished libevent'
fi


# Compile and install ncurses to ~/local

if [[ ! -f ~/local/include/ncurses/ncurses.h ]]; then
    tar -xzf ncurses-6.0.tar.gz
    cd ncurses-6.0
    echo 'Making ncurses'
    ./configure --prefix="$HOME/local"
    make
    make install
    cd ..
    echo 'Finished ncurses'
fi

# Compile and install tmux to ~/local

if [[ ! -f ~/local/bin/tmux ]]; then
    DIR="$HOME/local"
    export CFLAGS="-I$DIR/include -I$DIR/include/ncurses"
    export CPPFLAGS="-P"
    export LDFLAGS="-L$DIR/lib"
    tar -xzf tmux-2.0.tar.gz
    cd tmux-2.0
    ./configure --prefix="$HOME/local"
    make
    make install
    cd ..
fi

# Print some message if everything goes well
echo
echo 'You should be able to find the tmux binary under ~/local/bin/'
echo

echo 'Removed directory tmux.tmp/'
echo
cd ..
#rm -rf ./tmux.tmp

