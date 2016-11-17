set nocompatible
set tsl=5 "Temporary fix for redrawing bugs on scroll
set so=3
"behave mswin

"set guifont=Consolas:h12
set shell=powershell
set directory=$VIM/vimtemp,$VIM,.
set backupdir=$VIM/vimtemp,$VIM,.
set undodir=$VIM/vimtemp,$VIM,.
set viminfo+=n$VIM/vimtemp

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start

"Mapping Space to Leader
let mapleader = "\<Space>"
"<Leader>j Commands
nmap <Leader>jw :set wrap!
nmap <Leader>jl :setlocal number!<CR> 
nmap <Leader>jo :set paste!<CR>
"
"<Leader>f Commands
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
"
nmap <Leader>q :nohlsearch<CR>
nnoremap <Leader>; ;
map <Leader>w <C-w>

"TODO rebind 's' (same as cl) and rebind 'S' (same as cc)
"TODO map capslock to esc as well
nmap Y y$
inoremap <silent> <C-S> <Esc> :update<CR>
noremap <silent> <C-S> :update<CR>
inoremap jk <ESC>
nnoremap ; :
syntax on

"Splitting
set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
