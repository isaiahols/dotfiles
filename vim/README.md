VIM Setup
=========

All of my vim settings and plugins are contained within this directory (instead
of in ~/.vim). I just added this directory to my VIMRUNTIME path (see 
vimrc.symlink). This setup allows me to keep version history of the changes I
make to my vim configuration (which I seem to change often as I'm learning
what my preferences are). It also allows my vim setup to be portable.

I use the pathogen plugin to manage all my vim plugins - it autoloads all
plugins that are found in the bundle/ directory.
