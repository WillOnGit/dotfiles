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
set statusline=%f%=%l/%L
set laststatus=2
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
set backspace=indent,eol,start
set nowrap
set mouse=
set tabstop=4
set shiftwidth=4

" Leader key
let mapleader = "\<Space>"

" Key mappings
nnoremap <BS> :noh<CR>
noremap <Leader>y "*y
noremap <Leader>Y "*Y
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bp<CR>
nnoremap <Leader>U "_yiwgUl
nnoremap <Leader>u "_yiwgul
nnoremap <Leader>h :help<Space>
nnoremap <Leader>g :g/^/
nnoremap Y y$
nnoremap <Leader>c :s///gn<Left><Left><Left><Left>
nnoremap :: :<Up><CR>
nnoremap <Leader>v :e<Space>~/.vimrc<CR>

" easy-align plugin
xmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ 'd': { 'pattern': '\-' }
\ }

" Custom functions
function LatexQuotes()
	%s/''\([^`]\{-}\)''/``\1''/ceg
endfunction
" only accounts for pairs of ''double'' quotes not 'single' quotes

function StripTrailingWhitespace()
	%s/\s\+$//
endfunction

function ClearBlankLines()
              g/^\s*$/d
endfunction

function ClearInitialWhitespace()
              %s/^\s*//
endfunction

function CollapseSpaces()
              %s/ \+/ /g
endfunction

" Windows font
" set guifont=Menlo:h10
"
" probably ought to tidy this up
" YAML indentation fix
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
