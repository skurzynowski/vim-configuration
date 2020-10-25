filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'crusoexia/vim-monokai'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'styled-components/vim-styled-components'
Plugin 'skurzynowski/seba-units-calculator'

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
