filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType php set tabstop=4|set shiftwidth=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2
autocmd FileType python set tabstop=4|set shiftwidth=4

autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_class_in_global=1

set expandtab
set ruler

execute pathogen#infect()
syntax on

colorscheme lucius
LuciusDark

let mapleader = ","
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"nmap <leader>g :JSHintToggle<CR>
"let g:JSHintHighlightErrorLine = 0
nmap <leader>g :! grep -r "" .<Left><Left><Left>
nmap <leader>G :! grep -r "<C-r>"" .<CR>
nmap <leader>T :! open -a TextEdit %<CR>

map <m-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

runtime macros/matchit.vim

set relativenumber

set t_Co=256
"let &colorcolumn=join(range(81,999),",")
"set colorcolumn=81
"highlight ColorColumn ctermbg=234

set tags=./tags;

let @p = "import pdb;pdb.set_trace()"

" jshint settings
" let JSHintUpdateWriteOnly=1

" CtrlP setup
" Should be handled by pathogen...
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
