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


syntax reset
syntax on
set termguicolors      
set background=dark   

let s:none        = "NONE"
let s:bg          = "#272e33"
let s:red         = "#e67e80"
let s:green       = "#a7c080"
let s:yellow      = "#dbbc7f"
let s:blue        = "#7fbbb3"
let s:magenta     = "#d699b6"
let s:cyan        = "#83c092"
let s:fg          = "#bbc0b0"
let s:dark_black  = "#1e2326"
let s:light_black = "#859289"

execute 'hi CustomConstant guifg=' . s:red 
execute 'hi CustomComment guifg=' . s:light_black 
execute 'hi CustomException guifg=' . s:magenta 
execute 'hi CustomFunction guifg=' . s:blue 
execute 'hi CustomIdentifier guifg=' . s:fg 
execute 'hi CustomKeyword guifg=' . s:magenta 
execute 'hi CustomLabel guifg=' . s:fg 
execute 'hi CustomNonText guifg=' . s:cyan 
execute 'hi CustomOperator guifg=' . s:fg 
execute 'hi CustomPreproc guifg=' . s:magenta 
execute 'hi CustomSpecial guifg=' . s:fg 
execute 'hi CustomStatement guifg=' . s:magenta 
execute 'hi CustomString guifg=' . s:fg 
execute 'hi CustomType guifg=' . s:cyan 
execute 'hi CustomVisual guibg=' . s:dark_black 
execute 'hi Normal guibg=' . s:bg . ' guifg=' . s:fg 
execute 'hi ModeMsg guifg=' . s:fg 
hi! link Comment CustomComment
hi! link Function CustomFunction
hi! link String CustomString
hi! link Boolean CustomConstant
hi! link Identifier CustomIdentifier
execute 'hi Title guifg=' . "#FFFFFF" 
hi! link StorageClass CustomType
hi! link Type CustomType
hi! link Constant CustomConstant
hi! link Character CustomConstant
hi! link Exception CustomException
hi! link PreProc CustomPreproc
hi! link Label CustomLabel
hi! link NonText CustomNonText
hi! link Operator CustomOperator
hi! link Repeat CustomKeyword
execute 'hi Search guibg=' . s:green . ' guifg=' . s:bg 
execute 'hi CurSearch guibg=' . s:yellow . ' guifg=' . s:bg 
execute 'hi IncSearch guibg=' . s:yellow . ' guifg=' . s:bg 
hi! link Special CustomSpecial
hi! link Statement CustomStatement
hi! link Structure CustomKeyword
execute 'hi Delimiter guifg=' . s:fg 
execute 'hi StatusLine guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi StatusLineNC guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi StatusLineTerm guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi StatusLineTermNC guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi Tabline guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi TablineSel guibg=' . s:bg . ' guifg=' . s:fg 
execute 'hi TablineSelSymbol guibg=' . s:bg . ' guifg=' . s:green 
execute 'hi TablineFill guibg=' . s:none . ' guifg=' . s:none 
execute 'hi VertSplit guibg=' . s:bg . ' guifg=' . s:light_black 
hi! link Visual CustomVisual
hi! link VisualNOS CustomVisual
hi! link VisualNonText CustomVisual
execute 'hi Error guibg=' . s:bg . ' guifg=' . s:red 
execute 'hi ErrorMsg guibg=' . s:bg . ' guifg=' . s:red 
execute 'hi WarningMsg guibg=' . s:bg . ' guifg=' . s:yellow 
execute 'hi Pmenu guibg=' . s:bg . ' guifg=' . s:fg 
execute 'hi PmenuSel guibg=' . s:dark_black . ' guifg=' . s:fg 
execute 'hi PmenuSbar guibg='. s:bg . ' guifg=' s:fg
execute 'hi PmenuThumb guibg='. s:bg . ' guifg=' s:fg
hi! link WildMenu Pmenu
execute 'hi Question guifg=' . s:green 
execute 'hi MoreMsg guifg=' . s:red 
execute 'hi LineNr guibg=' . s:bg . ' guifg=' . s:light_black 
execute 'hi Cursor guifg=' . s:bg . ' guibg=' . s:yellow 
execute 'hi lCursor guifg=' . s:bg . ' guibg=' . s:yellow 
execute 'hi CursorLineNr guibg='. s:bg . ' guifg=' s:fg
execute 'hi CursorLine guibg=' . s:dark_black 
execute 'hi CursorColumn guibg=' . s:bg 
execute 'hi CursorLineSign guibg='. s:bg . ' guifg=' s:fg
execute 'hi Folded guibg=' . s:dark_black . ' guifg=' . s:yellow 
execute 'hi FoldColumn guibg=' . s:dark_black . ' guifg=' . s:yellow 
execute 'hi SignColumn guibg=' . s:bg . ' guifg=' . s:green 
execute 'hi Todo guibg=' . s:blue . ' guifg=' . s:yellow 
execute 'hi SpecialKey guibg=' . s:bg . ' guifg=' . s:blue 
execute 'hi MatchParen guibg=' . s:dark_black . ' guifg=' . s:fg 
execute 'hi Ignore guifg=' . s:red 
execute 'hi Underlined guifg=' . s:green 
execute 'hi QuickFixLine guibg=' . s:dark_black 
execute 'hi ColorColumn guibg=' . s:dark_black 
execute 'hi Conceal guibg=' . s:none . ' guifg=' . s:none 
