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
set splitbelow
set sidescroll=1
set wildignorecase
" see: https://jameschambers.co.uk/vim-typescript-slow
set regexpengine=0
set complete-=i " autocomplete suddenly started chugging one day in python codebase? Thought it was tags but seems not...

if &term == "alacritty"
	" set termguicolors
	set background=dark
endif

" vim 9.1 onwards package editorconfig support
packadd! editorconfig
"let g:EditorConfig_max_line_indicator = "none"
packadd! matchit
packadd! comment

" Leader key
let mapleader = "\<Space>"

" Key mappings
nnoremap <BS> :nohlsearch<CR>
noremap <Leader>y "+y
nnoremap <Leader>Y "+y$
noremap <Leader>p "+p
noremap <Leader>P "+P
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>N :bprevious<CR>
nnoremap <Leader>U "_yiwgUl
nnoremap <Leader>u "_yiwgul
nnoremap <Leader>h :help<Space>
nnoremap <Leader>g :global/^/
nnoremap <Leader>x :bnext<CR>:bdelete#<CR>
nnoremap <Leader>X :bnext<CR>:bdelete!#<CR>
nnoremap Y y$
nnoremap <Leader>c :substitute///gn<Left><Left><Left><Left>
nnoremap <Leader>C :%substitute///gn<Left><Left><Left><Left>
nnoremap :: :<Up><CR>
nnoremap <Leader>v :edit<Space>~/.vimrc<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>d :windo :diffthis<CR>
nnoremap <Leader>D :windo :diffoff<CR>
nnoremap <Leader>q :call QuickCC()<CR>
nnoremap <Leader>j :%!jq .<CR>
nnoremap <Leader>J :%!jq --sort-keys .<CR>
nnoremap <Leader>6 !!tr -d '\n' \| base64 -w 0<CR>
nnoremap <Leader>^ !!base64 -d<CR>
nnoremap <Leader>f :setlocal modifiable!<CR>
nnoremap <Left> :cprevious<CR>
nnoremap <Right> :cnext<CR>
nnoremap <Up> :1cc<CR>
nnoremap <Down> :cwindow<CR>
nnoremap <Tab> :b#<CR>
nnoremap <Leader>m :make<CR>
nnoremap <Leader>w :set wrap!<CR>
nnoremap <Leader>s :tab split<CR>
nnoremap K <Nop>
nnoremap <Leader>/ q/p:s:/:\\/:ge<CR><CR>
"nnoremap \ :qa<CR>
" Force n and N to search forwards and backwards
"nnoremap <expr> n 'Nn'[v:searchforward] . "zv"
"nnoremap <expr> N 'nN'[v:searchforward] . "zv"

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>a <Plug>(EasyAlign)

" Custom functions
function LatexQuotes()
	%s/''\([^`]\{-}\)''/``\1''/ceg
endfunction
" only accounts for pairs of ''double'' quotes not 'single' quotes

function StripTrailingWhitespace()
	%s/\s\+$//e
endfunction

function ClearBlankLines()
              g/^\s*$/d
endfunction

function ClearInitialWhitespace()
              %s/^\s*//e
endfunction

function CollapseSpaces()
              %s/ \+/ /ge
endfunction
function CollapseLines()
              %s/\n\{3,}/\r\r/ge
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

function CleanTerraformLogs()
			  %s:::ge
			  %s:::ge
			  %s:::ge
			  %s:\[\d\+m::ge
endfunction

" extra filetype settings
" is YAML indentation tweaking still needed on newer versions of vim?
autocmd FileType java setlocal expandtab foldmethod=indent foldlevel=1
autocmd FileType javascript setlocal foldmethod=indent foldlevel=1
autocmd FileType json setlocal sw=2 foldmethod=indent foldlevel=1
autocmd FileType xml setlocal foldmethod=indent foldlevel=1
autocmd FileType markdown setlocal wrap spell
autocmd FileType text setlocal wrap
autocmd FileType yaml setlocal foldmethod=indent ts=2 sts=2 sw=2 indentkeys-=0# indentkeys-=<:>
