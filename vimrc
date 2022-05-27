" enable plugins
" execute pathogen#infect()
" colorscheme forest-night
" colorscheme csharp
" colorscheme space-vim-dark
" let g:space_vim_dark_background = 233
" color space-vim-dark

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" color
Plug 'morhetz/gruvbox'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" whatever the fuck fzf is
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" better JSX highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" racket coloring
Plug 'ngstroth/vim-racket'

call plug#end()

colorscheme gruvbox
set background=dark

let g:VimTodoListsDatesEnabled = 1

" only enable if using pathogen#infect
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
set hidden
set noswapfile

set nowrap
set scrolloff=10

" better searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" ENV Variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Autocomplete
set path=.,**
set wildmode=longest,list,full

" Vim split is weird
set splitbelow splitright

" leader mappings
nnoremap <SPACE> <Nop>
:let mapleader = " "
:map <Leader>q @q

" remap split switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"auto delete trailing white space
autocmd BufWritePre * %s/\s\+$//e

"definition jumping
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>



" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

