" =============================================================================
" VUNDLE SETUP
" =============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" =============================================================================
" VUNDLE PLUGINS
" =============================================================================

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'rhysd/devdocs.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" VIM SETTINGS
" =============================================================================

syntax on
colorscheme delek
set relativenumber
set number
set autoindent
set nowrap
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set undofile
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

