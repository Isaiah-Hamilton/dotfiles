set nocompatible
filetype off

set number
set ruler
syntax on
set mouse=nicr

" --- Encoding ---
set encoding=utf-8

" --- Spell Checker ---
set spell spelllang=en_us

" --- Whitespace ---
set autoindent smartindent
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" --- Search ---
set hlsearch
set incsearch
set ignorecase smartcase

" --- Remap ESC ---
inoremap jj <Esc>
inoremap jk <Esc>

" --- UI ---
set laststatus=2
set colorcolumn=80
set background=dark
set showmode
set showmatch
set showcmd

" --- Remove Sounds Effects ---
set noerrorbells
set visualbell

" --- Plugins ---
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

" --- Color Scheme ---
colorscheme gruvbox

" --- NERDTree config ---
map <silent> <C-n> :NERDTreeFocus<CR>
let NERDTreeIgnore=['.DS_Store', 'node_modules']
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1 

" --- Gitgutter config ---
set updatetime=100
set signcolumn=no
let g:gitgutter_signs=0
let g:gitgutter_highlight_linenrs=1
highlight GitGutterAddLineNr ctermfg=Green
highlight GitGutterChangeLineNr ctermfg=Yellow
highlight GitGutterDeleteLineNr ctermfg=Red
highlight GitGutterChangeDeleteLineNr ctermfg=Red
