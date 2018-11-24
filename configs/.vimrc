" My Vim configuration as of 2018
" Author: Cody Welsh

" Legacy compatibility not needed these days
set nocompatible

filetype off

" VimPlug Configuration
" ---------------------
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SevereOverfl0w/deoplete-github'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neoinclude.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'Shougo/neco-syntax'

" Code snippet completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<F9>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" For multi-selection LSP support
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" Realtime MD preview
let vim_markdown_preview_github=1

" Deoplete options
" ----------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

let g:deoplete#sources#ternjs#timeout = 1

" Add the types of individual completions
let g:deoplete#sources#ternjs#types = 1

" Add any possible documentation strings if they're found
let g:deoplete#sources#ternjs#docs = 1
" End Deoplete options
" ----------------


" LanguageClient
" --------------
set hidden

let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ 'sh': ['bash-language-server', 'start']
      \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F4> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
nnoremap Y :LanguageClientStart<CR>

" End LanguageClient
" --------------

" Faster switching between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" End highlighting without typing a command
map <F3> :nohl<CR>

" Allows one to hit <CR> after an opening bracket and arrive at a decent
" place (usually indented and between two brackets, for instance).
let g:delimitMate_expand_cr = 1

" Highlight invisible trailing spaces, etc.
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

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
set backspace=2
set textwidth=72
set ignorecase
set smartcase

" Delicious dark gruvbox
colorscheme gruvbox
set background=dark

" ALE Config
" ----------
"
" let g:ale_completion_enabled = 1

" Object specifying specific JS/CSS/*.* linters to use in ALE
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['stylelint'],
\   'ruby': ['brakeman', 'rails_best_practices', 'rubocop']
\}

" Same as above, but for fixing errors automatically
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['stylelint'],
\   'ruby': ['rufo', 'rubocop']
\}

" Maps F2 to :ALEFix
noremap <F2> :ALEFix<CR>
" nnoremap K :ALEHover<CR>
" nnoremap gd :ALEGoToDefinition<CR>
" nnoremap <F4> :ALEFindReferences<CR>


" End ALE Config
" ----------
