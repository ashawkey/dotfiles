" .vimrc for win10

" encoding
set encoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8

" BackSpace
set backspace=indent,eol,start

" Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" hidden buffers
set hidden

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile

set fileformats=dos,unix,mac
set showcmd

" indent
set autoindent
set smartindent

" visual
syntax on
set ruler
set number
set nowrap
colorscheme desert

" gvim
set clipboard+=unnamed
set guifont=YaHei_Consolas_Hybrid:h11.5
set go=

" blinking
set gcr=a:blinkon0

set scrolloff=3

set modeline
set modelines=10

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


