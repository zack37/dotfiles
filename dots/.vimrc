set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'wting/rust.vim' 
Plugin 'tpope/vim-fugitive' 
Plugin 'itchyny/lightline.vim' 
Plugin 'timonv/vim-cargo' 
Plugin 'Mofiqul/vscode.nvim'

call vundle#end()
filetype plugin indent on

set confirm
set visualbell

set autoread
set noswapfile

set undodir=~/.vim_undodir
set undofile

set history=1000
set undolevels=1000

set clipboard=unnamed

set expandtab
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic

set encoding=utf-8
set scrolloff=7

set wildmenu
set wildmode=list:full
set cursorline
set cmdheight=2

set showmatch
set number
set relativenumber
set ttyfast
set ruler

syntax on
set laststatus=2
set noshowmode
set t_Co=256
set background=dark

nmap <SPACE> :noh<ENTER>

nnoremap ; :
command! W write
