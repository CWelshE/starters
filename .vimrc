set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'vimwiki/vimwiki'
Plugin 'posva/vim-vue'
call vundle#end()
filetype plugin indent on

let g:syntastic_html_checkers = ['w3']

inoremap jf <esc>
syntax on
syntax enable

set ruler
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set wildmenu
set showcmd
set encoding=utf-8
set autoindent
set cursorline
set number
set undofile

colorscheme gruvbox
set background=dark
