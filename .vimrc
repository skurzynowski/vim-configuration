set nocompatible              " be iMproved, required
so ~/.vim/plugins.vim

syntax enable
colorscheme monokai

set backspace=indent,eol,start
set number
  "Change map leader (default is \)
let mapleader = ',' 	
"set linespace=15
set nocompatible
set clipboard=unnamed

" Wild menu
set wildmenu
"-- search recursively----" 
set path=$PWD/**
"----------Mappings------------"
"---- PLUGINS
"
"----- CTRP ctrl 
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <Leader>s1 :CtrlP ~/Projects/lendflo/Catto<cr>
nmap <Leader>s2 :CtrlP ~/Projects/lendflo/Reyntiens<cr>
nmap <Leader>s3 :CtrlP ~/Projects/lendflo/Catto/src/ui/catto2<cr>
let g:ctrlp_show_hidden = 1

set wildignore+=*/node_modules/*
set wildignore+=*/.git/*

"------- NERDTREE
"let NERDTreeHijackNetrw = 0
nmap <Leader>` :NERDTreeToggle<cr>
let NERDTreeShowHidden=1


" Make it easy to edit the Vimrc file. "
nmap <Leader>ed :tabedit $MYVIMRC<cr>
nmap <Leader>edp :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>eda :tabedit ~/.alacritty.yml<cr>
imap jj <Esc>

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
command! MakeTags !ctags -R .

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

" ----------------- INDENT
"set expandtab
"1set shiftwidth=4
"set softtabstop=4
"filetype plugin indent on

" tsx higlignt
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" change current dir
set autochdir

" coc 

" code complition
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" TextEdit might fail if hidden is not set.
verbose imap <tab>
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>lf :CocCommand eslint.executeAutofix<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"set laststatus=2
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"set statusline=
"set statusline+=%{StatuslineGit()}
"set statusline+=[YOU\ ARE\ AMAZING\ SEBASTIAN]

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  ['.l:branchname.'] ':''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Snippets 
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
" https://github.com/neoclide/coc-snippets
xmap <leader>x  <Plug>(coc-convert-snippet)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! Comment(operator) range
    "TODO add logic to comment lines by number operator
    if(v:count > 0)
        echo v:count
        echo v:beval_lnum
        return
    endif
    let lnum = a:firstline
    let commentedLines = 0
    while lnum <= a:lastline
        let line = getline(lnum) 
        let commentedLines = match(line, '//') == 0 ? commentedLines + 1 : commentedLines
        let lnum = lnum + 1
    endwhile
    let lnum = a:firstline
    let isCommented = commentedLines == a:lastline - a:firstline + 1 ? 1 : 0
    let spattern = isCommented == 1 ? '^\/\/' : '^'
    let rpattern = isCommented == 1 ? '' : '//'
    while lnum <= a:lastline
        let line = getline(lnum) 
        let repl = substitute(line, spattern, rpattern,'')
        call setline(lnum,repl)
        let lnum = lnum + 1
    endwhile
endfunction

hi Normal guibg=NONE ctermbg=NONE

" avoid remap for esc ( problem was when hit backspace insert ^? )
noremap! <C-?> <C-h>

" colors for theme
ab 0377CB ${({ theme }) => theme.colors.primary}
ab 3BA4F5 ${({ theme }) => theme.colors.blue0}
ab 62B6F7 ${({ theme }) => theme.colors.blue1}
ab 89C8F9 ${({ theme }) => theme.colors.blue2}
ab B0DAFB ${({ theme }) => theme.colors.blue3}
ab D7EDFD ${({ theme }) => theme.colors.blue4}
ab F5FAFF ${({ theme }) => theme.colors.blue5}
ab FCFEFF ${({ theme }) => theme.colors.blue6}
ab 0D181F ${({ theme }) => theme.colors.grey0}
ab 19232A ${({ theme }) => theme.colors.grey1}
ab 4C5459 ${({ theme }) => theme.colors.grey2}
ab 999DA0 ${({ theme }) => theme.colors.grey3}
ab CCCECF ${({ theme }) => theme.colors.grey4}
ab C9CED6 ${({ theme }) => theme.colors.grey4}
ab E5E6E7 ${({ theme }) => theme.colors.grey5}
ab F2F2F3 ${({ theme }) => theme.colors.grey6}
ab 10B07B ${({ theme }) => theme.colors.success}
ab FFAF01 ${({ theme }) => theme.colors.warning}
ab DD2727 ${({ theme }) => theme.colors.danger}
ab cosnt const
