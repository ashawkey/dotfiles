"" Vundle start
set nocompatible              
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'valloric/youcompleteme'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'terryma/vim-multiple-cursors'


call vundle#end()            " required

filetype plugin indent on    " required
"" Vundle end


" encoding
set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8
set bomb
set binary

" BackSpace
set backspace=indent,eol,start

" Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" hidden buffers
set hidden

" mouse is sometimes better
set mouse=a 

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash

" visual
syntax on
set ruler
set number
set nowrap

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme molokai
endif

set mousemodel=popup
set t_Co=256 "color mapping
set guioptions=egmrti
set gfn=Monospace\ 10

" blinking
set gcr=a:blinkon0

set scrolloff=3
set laststatus=2

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" search mapping
nnoremap n nzzzv
nnoremap N Nzzzv

" mappings
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
map <C-n> :NERDTreeToggle<CR>
set pastetoggle=<F3>

" airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


" remember cursor
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" early sync
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

set autoread


" gcc run
map <F5> :call CompileRunGcc()<CR>
imap <F5> <Esc>:call CompileRunGcc()<CR> 
func! CompileRunGcc()
    exec "w"
	    if &filetype == 'c'
			exec "!g++ % -o %<"
			exec "! %<"
		elseif &filetype == 'cpp'
		    exec "!g++ -std=c++11 % -o %<"
		    exec "! %<"
		elseif &filetype == 'java' 
		    exec "!javac %" 
		    exec "!java %<"
		elseif &filetype == 'sh'
		    :!./%
		endif
endfunc
map <F6> :! %<<CR>


" some abbr
iab #c++ #include <iostream><CR>using namespace std;<CR>int main(){<CR><CR>}
iab #b /******************************************
iab #e <Space>******************************************/
iab scanf scanf("%",)
iab printf printf("%",)

" leader
let mapleader=";"

