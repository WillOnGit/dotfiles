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

" Allow hidden buffers
set hidden

" Set colorscheme
"colorscheme kaltex
"set lines=24 columns=80
set autoread
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set visualbell
nnoremap <BS> :noh<CR>
" let mapleader = <Space>
" nnoremap <Leader>d dd

" custom functions
" LatexQuotes breaks in case with multiple good quotes on same line
function LatexQuotes()
	%s/''\(.\{-}\)''/``\1''/g
endfunction

function StripTrailingWhitespace()
	%s/\s*$//
endfunction
