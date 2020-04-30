#!/bin/bash

echo "Creating empty ctags and cscope.out files"

# ctags
touch tags

# cscope.out
touch cscope.out

echo "Creating YCM file"

# Create the ycm file
ycm_create_update.sh


echo "Done"


