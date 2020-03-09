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
Plugin 'kchmck/vim-coffee-script'
Plugin 'csexton/trailertrash.vim'
Plugin 'posva/vim-vue'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'adoy/vim-php-refactoring-toolbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" NERDTREE SETTINGS
" =============================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" =============================================================================
" VIM AIRLINE SETTINGS
" =============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

let g:airline_powerline_fonts = 1

" =============================================================================
" VIM PHP REFACTORING TOOLBOX SETTINGS
" =============================================================================

" =============================================================================
" VIM SETTINGS
" =============================================================================

syntax on
colorscheme delek
set autoindent
set nowrap
set undofile
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set showcmd
set ttimeoutlen=100

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" set me leader to be comma
let mapleader=","
let g:mapleader=","

" Hide, dont close buffers
set hidden

" Set the title of the vim window to the open file
set title

" Always have 5 lines of context before/after the current line
set scrolloff=5

" Always show the current position
set ruler

" Highligh the current line
set cursorline

" Turn off annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Display linenumbers but use relative numbering
set number
set relativenumber

" automatically indent new lines
set autoindent

" default ident to 2 spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" two spaces for .yml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" two spaces for .js
au! BufNewFile,BufRead *.js setf js
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab

" two spaces for .vue
au! BufNewFile,BufRead *.vue setf vue
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab

" shortcut for moving btw open buffers
nnoremap <leader>. :bn<CR>  " next buffer
nnoremap <leader>, :bp<CR>  " previous buffer
