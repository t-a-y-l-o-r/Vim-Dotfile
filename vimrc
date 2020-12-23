" enable plugins
execute pathogen#infect()
" colorscheme forest-night
colorscheme gruvbox
" colorscheme csharp

" dark mode op
set background=dark

" proper colors
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set transparent background
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Basics
syntax on
set number relativenumber
filetype plugin indent on
set hlsearch " enable highlight on search
set hidden
set noswapfile

" ENV Variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Autocomplete
set path=.,**
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

