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
nnoremap <Space> <Nop>
"<Leader>j Commands
nnoremap <Leader>jw :set wrap!<CR>
nnoremap <Leader>jl :setlocal number!<CR>
"
"<Leader>e Commands
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
"
nmap <Leader>q :nohlsearch<CR>
nnoremap <Leader>; ;
map <Leader>w <C-w>

"TODO rebind 's' (same as cl) and rebind 'S' (same as cc)
"TODO map capslock to esc as well
nmap Y y$
nnoremap Q @q
inoremap <silent> <C-S> <Esc> :update<CR>
noremap <silent> <C-S> :update<CR>
nnoremap ; :
syntax on

"Splitting
set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch
