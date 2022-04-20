syntax on

:set number 
:set relativenumber

filetype plugin indent on
:set autoindent
:set tabstop=4 
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set splitbelow
:set splitright
:set encoding=UTF-8

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
