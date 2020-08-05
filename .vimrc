" =============================================================================
" VIM PLUG SETUP
" =============================================================================
" This will load and install vim-plug if it isn't already installed.
" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" =============================================================================
" VIM PLUG PLUGINS
" =============================================================================

Plug 'mhinz/vim-startify'
Plug 'rhysd/devdocs.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'csexton/trailertrash.vim'
Plug 'posva/vim-vue'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Add plugins to &runtimepath
call plug#end()

" =============================================================================
" CTRLP SETTINGS
" =============================================================================

let g:ctrlp_custom_ignore = 'node_modules\|vendor\|git'

" =============================================================================
" COC SETTINGS
" =============================================================================

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)

" =============================================================================
" VIM AIRLINE SETTINGS
" =============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

let g:airline_powerline_fonts = 1

" =============================================================================
" ALE SETTINGS
" =============================================================================
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\ }
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights = 0

" =============================================================================
" VIM SETTINGS
" =============================================================================

let g:startify_custom_header = [
  \ '         _                       _      /\/|',
  \ '     ___| |__   __ _ _   _ _ __ (_) ___|/\/',
  \ '    / __| ''_ \ / _` | | | | ''_ \| |/ _ \',
  \ '    \__ \ | | | (_| | |_| | | | | | (_) |',
  \ '    |___/_| |_|\__,_|\__,_|_| |_|_|\___/',
  \ ]

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

" set leader to be space
let mapleader=" "
let g:mapleader=" "

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
set shiftwidth=4
set tabstop=4
set softtabstop=4

" two spaces for .yml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" shortcut for moving btw open buffers
nnoremap <leader>h :bn<CR>  " next buffer
nnoremap <leader>l :bp<CR>  " previous buffer
