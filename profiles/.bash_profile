# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# OS
OS=$(uname -s)

#if [ $OS == "SunOS" ]; then
#    return;
#fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink 2>/dev/null || which readlink 2>/dev/null)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return # `exit 1` would quit the shell itself
fi


# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{functions,env,aliases,prompt}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done


# Set LSCOLORS
DIRCOLORS=$(which dircolors 2>/dev/null || which gdircolors 2>/dev/null)
eval "$("$DIRCOLORS" "$DOTFILES_DIR"/system/.dir_colors 2>/dev/null )"

# Hook for extra/custom stuff
EXTRA_DIR="$HOME/.extra"

if [ -d "$EXTRA_DIR" ]; then
  for EXTRAFILE in "$EXTRA_DIR"/extras/*.sh; do
    [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
  done
fi

# Autocompletion for git
. "$DOTFILES_DIR"/git/git-completion.bash

# Autocompletion for bash
[ -f /etc/bash_completion ] && . /etc/bash_completion || {
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion ]
}

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export OS DOTFILES_DIR EXTRA_DIR 

# Open up tmux on login
# [ ! -z "$TMUX" ] || (tat dev || tnews dev)


# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# # Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT="/Users/nathan.nash/projects/conan/cocos2d-x/_src/tools/cocos2d-console/bin"
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# # Add environment variable COCOS_X_ROOT for cocos2d-x
# export COCOS_X_ROOT="/Users/nathan.nash/projects/conan/cocos2d-x"
# export PATH=$COCOS_X_ROOT:$PATH

# # Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT="/Users/nathan.nash/projects/conan/cocos2d-x/_src/templates"
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH
# export PATH="/usr/local/opt/opencv@2/bin:$PATH"

# export DYLD_FALLBACK_LIBRARY_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"

export BASH_SILENCE_DEPRECATION_WARNING=1