" =============================================================================
" vim setup
" =============================================================================

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" =============================================================================
" fzf is a fuzzy search tool.
" =============================================================================
set rtp+=/usr/local/opt/fzf


" =============================================================================
" Vundle and plugins setup
" =============================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Could also pass in a path to where vundle should install plugins ie
" call vundle#begin('~/some/path/here')


" Let Vundle manage vundle
" Plugin 'file://'.$HOME.'/.vim/bundle/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-scripts/a.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'brookhong/cscope.vim'
Plugin 'yssl/QFEnter'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-dispatch'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'rhysd/vim-clang-format'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'mbbill/undotree'
Plugin 'qpkorr/vim-bufkill'
" Plugin 'dkprice/vim-easygrep'
" Plugin 'SirVer/ultisnips'


" Done loading the plugins
" Helpful vundle commands
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
call vundle#end()

" vim general setup
so $HOME/.vim/config/vim_general.setup

" Key mappings
so $HOME/.vim/config/key_mappings.setup

" Plugin specific settings
so $HOME/.vim/config/plugins.setup

" status line
so $HOME/.vim/config/colors_statusline.setup


" Enable mouse
" Note that when running Vim inside a terminal, with mouse enabled, you cannot
"   select text with the terminal anymore (to copy it to the system clipboard).
"   To overcome this, the vim-togglemouse plugin maps the <F3> key to toggle
"   the mouse enable.
" set mouse=a

