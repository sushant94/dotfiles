" defaults
:set autoindent
:set smartindent
filetype indent on
:set number
:set relativenumber
filetype plugin on
set omnifunc=syntaxcomplete#Complete
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
set noexpandtab
" Set max length of line to be 78.
set tw=78
":set expandtab
set autoread
" Remaps for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
map <silent> <C-R> :vertical resize 150<CR>:resize 80<CR>

" unmap arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Pathogen
execute pathogen#infect()
syntax enable

" Theme
set background=dark
set t_Co=256
colorscheme 256-Jungle

" Vertical movement without wrapping.
nmap j gj
nmap k gk

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

" Goto last buffer and cycle through buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Syntactic syntax checker
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_auto_refresh_includes = 1

" CTRLP
nmap ; :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" NerdTreeToggle
:nmap \e :NERDTreeToggle<CR>

" Powerline
let g:Powerline_symbols = 'unicode'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let mapleader="," 

" clang formatter
let g:clang_format#code_style = 'mozilla'
"let g:clang_format#auto_format = 1
"let g:clang_format#auto_formatexp = 1
"let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#command = 'clang-format-3.4'

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Allow backspace over everything
set backspace=indent,eol,start

" Set warning for 80 column length
highlight ColorColumn ctermbg=052 guibg=#850000
set cc=100
nmap \l :call WarnToggle()<CR>
function! WarnToggle()
	if &colorcolumn
		set cc=
	else
		set cc=100
	endif
endfunction

" Highlight unwanted whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
:match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
":match ExtraWhitespace /^\t*\zs \+/
" Switch off :match highlighting.
:match

:nnoremap \wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
:nnoremap \wf :match<CR>

" Some rust specific things to help out
:nnoremap \rf :!rustfmt % --write-mode=overwrite<CR>
:nnoremap \cb :!cargo build<CR>
