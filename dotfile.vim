" enable plugins
execute pathogen#infect()
colorscheme gruvbox

" Basics
syntax on
set number relativenumber
filetype plugin indent on
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Autocomplete
set path+=**
set wildmode=longest,list,full

" Vim split is weird
set splitbelow splitright

" leader mappings
:let mapleader = " "
:map <Leader>q @q

" remap split switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"auto delete trailing white space
autocmd BufWritePre * %s/\s\+$//e

" File type stuff
autocmd FileType javascript setlocal ts=3 sts=3 sw=3
autocmd FileType css setlocal ts=3 sts=3 sw=3
