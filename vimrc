" This .vimrc has taken inspiration from a few sources
" as well as custom entries as required
" URL: http://vim.wikia.com/wiki/Example_vimrc
" URL: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

" settings
set nocompatible
filetype indent plugin on
syntax enable
set encoding=utf-8
set statusline=%n\ %f\ %m%=%l/%L
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
set diffopt=filler,vertical
set cursorline
set splitright
set sidescroll=1
set wildignorecase

" Leader key
let mapleader = "\<Space>"

" Key mappings
nnoremap <BS> :noh<CR>
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bp<CR>
nnoremap <Leader>U "_yiwgUl
nnoremap <Leader>u "_yiwgul
nnoremap <Leader>h :help<Space>
nnoremap <Leader>g :g/^/
nnoremap <Leader>x :bn<CR>:bd#<CR>
nnoremap Y y$
nnoremap <Leader>c :s///gn<Left><Left><Left><Left>
nnoremap <Leader>C :%s///gn<Left><Left><Left><Left>
nnoremap :: :<Up><CR>
nnoremap <Leader>v :e<Space>~/.vimrc<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>d :windo :difft<CR>
nnoremap <Leader>D :windo :diffoff<CR>
nnoremap <Leader>q :call QuickCC()<CR>
nnoremap <Leader>j :%!jq .<CR>
" Force n and N to search forwards and backwards
"nnoremap <expr> n 'Nn'[v:searchforward] . "zv"
"nnoremap <expr> N 'nN'[v:searchforward] . "zv"

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

function QuickCC()
	let now_cc = &cc
	let current_col = virtcol(".")
	if now_cc != current_col
		let &cc = current_col
	else
		let &cc = ""
	endif
endfunction

" extra filetype settings
" is YAML indentation tweaking still needed on newer versions of vim?
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 indentkeys-=0# indentkeys-=<:>
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2 ft=javascriptreact
autocmd FileType markdown setlocal wrap spell
autocmd FileType text setlocal wrap
" gentoo-specific text setting
let g:leave_my_textwidth_alone = "yes"
autocmd FileType java setlocal expandtab foldmethod=indent
autocmd FileType json setlocal foldmethod=indent shiftwidth=2
