filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType php set tabstop=4|set shiftwidth=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2
autocmd FileType python set tabstop=4|set shiftwidth=4

set expandtab
set ruler

execute pathogen#infect()
syntax on

let mapleader = ","
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"nmap <leader>g :JSHintToggle<CR>
"let g:JSHintHighlightErrorLine = 0
nmap <leader>g :! grep -r "" .<Left><Left><Left>

map <m-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

runtime macros/matchit.vim

set relativenumber

set t_Co=256
"let &colorcolumn=join(range(81,999),",")
set colorcolumn=81
highlight ColorColumn ctermbg=234

set tags=./tags;

let @p = "import pdb;pdb.set_trace()"
