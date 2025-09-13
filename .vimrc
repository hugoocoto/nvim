let g:did_install_default_menus = 1
let mapleader = " "

set tabstop=8
set shiftwidth=8
set softtabstop=-1
set expandtab
set smartindent
set relativenumber
set number
set nowrap
set scrolloff=8
set sidescrolloff=8
set nohlsearch
set incsearch
set ignorecase
set smartcase
set updatetime=1000
set conceallevel=0
set colorcolumn=+0
set textwidth=80
set signcolumn=yes
set guicursor=
set virtualedit=block
set noswapfile
set nobackup
set undofile
set undodir=$HOME/.vim/undodir
set wildignorecase
set noshowmode
set noruler
set noshowcmd
set clipboard=unnamedplus

" ----------------------------------------------------------------------------- 
" Autocommands
" -----------------------------------------------------------------------------

autocmd BufReadPre *.pdf execute '!xdg-open ' . expand('<afile>') | bdelete

autocmd BufRead,BufNewFile *.txt,*.md,*.typ setlocal formatoptions=tln spell wrap linebreak
autocmd BufRead,BufNewFile *.txt,*.md,*.typ setlocal spelllang=en,es
autocmd BufRead,BufNewFile *.txt,*.md,*.typ nnoremap <buffer> <leader>c 1z=

" ----------------------------------------------------------------------------- 
" Remaps
" -----------------------------------------------------------------------------
nnoremap <leader><leader> gg=G
xnoremap <leader>p "_dP
nnoremap <C-k> :cprev<CR>zz
nnoremap <C-j> :cnext<CR>zz
nnoremap <leader>ff :Ex<CR>
nnoremap <leader>e :Ex<CR>

syntax on
colorscheme default
