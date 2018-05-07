" My Vim configuration as of May 2018
" Author: Cody Welsh

set nocompatible
set textwidth=72
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']

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
