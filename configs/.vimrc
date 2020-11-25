" My Vim configuration as of 11/24/2020
" Author: Cody Welsh

set encoding=utf-8
:scriptencoding UTF-8

filetype off

" VimPlug Configuration
" ---------------------
call plug#begin('~/.local/share/nvim/plugged')

" Visuals-related
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'

" Text modification-related
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'

" File search related
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" Code snippet completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<F9>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Syntax-related
Plug 'sheerun/vim-polyglot'

" Tim Pope plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'

" Status-related
Plug 'vim-airline/vim-airline'

" Completion-related
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" - coc.nvim configuration
set cmdheight=2
set updatetime=300
set signcolumn=yes
set shiftwidth=2

" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
" 'Pattern not found', 'Back at original', etc.
set shortmess+=c

" If popup menu visible, tab => C-n
" Else, if <SNR>check_back_space()x | x = local script num,
" tab = <TAB>;
" else, refresh popup completion menu.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" If there _is_ a column prior to the cursor's current position,
" Check if a space or tab exists there
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Invoke completion with Ctrl-D
inoremap <silent><expr> <c-d> coc#refresh()

" Use <CR> to confirm a completion option
inoremap <expr> <cr>
      \ complete_info()["selected"]
      \ != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if(index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Linting/Fixing-related
Plug 'w0rp/ale'

" Elixir-related
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slashmili/alchemist.vim'

" Pass Elixir `.exs` files through MixFormat on file save
let g:mix_format_on_save = 1

" A personal wiki in vim
Plug 'vimwiki/vimwiki'

" Cool, super quick fuzzy finder
Plug 'junegunn/fzf'
nnoremap <S-y> :FZF<CR>

" invoke cheat.sh for fast info in vim!
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

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
set tabstop=2
set softtabstop=2
set expandtab
set wildmenu
set showcmd
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
\   'javascript': ['tsserver', 'prettier', 'eslint'],
\   'javascriptreact': ['tsserver', 'prettier', 'eslint'],
\   'css': ['stylelint'],
\   'ruby': ['brakeman', 'rails_best_practices', 'rubocop'],
\   'sh': ['shellcheck', 'bash-language-server', 'start']
\}

" Same as above, but for fixing errors automatically
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'css': ['stylelint'],
\   'ruby': ['rufo', 'rubocop']
\}

" Maps F2 to :ALEFix
noremap <F2> :ALEFix<CR>
" nnoremap K :ALEHover<CR>
" nnoremap gd :ALEGoToDefinition<CR>
" nnoremap <F4> :ALEFindReferences<CR>

" ----------
" End ALE Config
