set nocompatible              " be iMproved, required
so ~/.vim/plugins.vim

syntax enable
colorscheme desert

set backspace=indent,eol,start
set number
  "Change map leader (default is \)
let mapleader = ',' 	
set linespace=15
set nocompatible

" Wild menu
set wildmenu
"-- search recursively----" 
set path=$PWD/**
"----------Mappings------------"
"---- PLUGINS
"
"----- CTRP 
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
"------- NERDTREE
let NERDTreeHijackNetrw = 0
" Make it easy to edit the Vimrc file. "
nmap <Leader>ed :tabedit $MYVIMRC<cr>
imap jj <Esc>
nmap <D-&> :NERDTreeToggle<cr>

"----------Search------------"
set hlsearch
set incsearch
"----------Auto-Commands------------"
"Add simple command removal
nmap <Leader><space> :nohlsearch<cr>

"----------Auto-Commands------------"

"Automatically source the Vimrc file on save.
augroup autosorcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"Add simple command removal
nmap <Leader><space> :nohlsearch<cr>
command! MakeTags !ctags -R .
" set php higlighting
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"---- VISUAL------------------
set t_CO=256
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e
"-------------- Split management --------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
