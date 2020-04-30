#!/bin/sh

# Check to see if we need to install tmux
if ! type tmux &> /dev/null; then
  ./tmux/install.sh
fi
