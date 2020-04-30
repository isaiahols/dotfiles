#!/bin/bash

# might need to change this?
make lib

project_dir=`pwd`

echo $project_dir


# Add \ in front of / for sed.
sed_project_dir=$( echo $project_dir | sed 's/\//\\\//g' )

# if there is not a .ycm_extra_conf.py file in the project then put one there.
if [ ! -f $project_dir/.ycm_extra_conf.py ]; then
  cp ~/.ycm_extra_conf.py .
fi

ycm_config_file=$project_dir/.ycm_extra_conf.py

# Bash magic to remove previous include directories.
sed -i '/Insert include paths here/,/End include paths/{//!d}' $ycm_config_file

# Add src path to ycm_config_file
sed -i "s/^.*Insert include paths here.*/&\\n\'-I$sed_project_dir\/src\',/" \
  $ycm_config_file

# Add dependencies' include folders to ycm_config_file
dependencies=`ls $project_dir/build/dependencies/*/include -d | tr '\n' ' '`
dependencies=$( echo $dependencies | sed 's/\//\\\//g' )
for i in $dependencies; do
  sed -i "s/^.*Insert include paths here.*/&\\n\'-I$i\',/" $ycm_config_file
done

dependencies=`ls $project_dir/build/dependencies/*/src -d | tr '\n' ' '`
dependencies=$( echo $dependencies | sed 's/\//\\\//g' )
for i in $dependencies; do
  sed -i "s/^.*Insert include paths here.*/&\\n\'-I$i\',/" $ycm_config_file
done

dependencies=`ls $project_dir/build/dependencies/*/*/include -d | tr '\n' ' '`
dependencies=$( echo $dependencies | sed 's/\//\\\//g' )
for i in $dependencies; do
  sed -i "s/^.*Insert include paths here.*/&\\n\'-I$i\',/" $ycm_config_file
done
