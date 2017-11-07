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
set path+=**
"----------Mappings------------"

" Make it easy to edit the Vimrc file. "
nmap <Leader>ed :tabedit $MYVIMRC<cr>


"----------Search------------"
set hlsearch
set incsearch

"----------Auto-Commands------------"

"Automatically source the Vimrc file on save.
augroup autosorcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
"Add simple command removal
nmap <Leader><space> :nohlsearch<cr>
command! MakeTags !ctags -R .
