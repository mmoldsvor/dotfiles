let mapleader="\<Space>"
syntax on

set number 
set relativenumber

filetype plugin indent on
set autoindent
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright
set encoding=UTF-8
set termguicolors
set laststatus=3

" Remap window movement keys
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

if has("nvim")
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()

if has("nvim")
    luafile ~/.config/nvim/lua/init.lua
endif

colorscheme gruvbox

" Netrw
nnoremap <leader>e :Explore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Remap for fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Rg<cr>

" Options for search and replace
nnoremap <leader>s :%s//g<left><left>
nnoremap <leader>S :%s//gc<left><left><left>
