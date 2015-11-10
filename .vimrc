autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType php set tabstop=4|set shiftwidth=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2

set expandtab
set number

execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = ","
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nmap <leader>g :JSHintToggle<CR>

let g:JSHintHighlightErrorLine = 0

map <m-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

runtime macros/matchit.vim
