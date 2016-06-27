" This .vimrc has taken inspiration from a few sources
" as well as custom entries as required
" URL: http://vim.wikia.com/wiki/Example_vimrc
" URL: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
"
" Disable vi compatibility for more features?
set nocompatible

" Enable filetype detection and loading indentation and plugins
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Use tpope's pathogen plugin manager
execute pathogen#infect()

" Set default encoding
set encoding=utf-8

" Set misc behavioural options
set hidden
set autoread
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set visualbell

" Key remappings
nnoremap <BS> :noh<CR>
" let mapleader = <Space>
" nnoremap <Leader>d dd

" Custom functions
function LatexQuotes()
	%s/''\([^`]\{-}\)''/``\1''/ceg
endfunction
" only accounts for pairs of double quotes, ''like these''

function StripTrailingWhitespace()
	%s/\s*$//
endfunction
