" Use bash as the VIM shell.
set shell=/bin/bash

" Syntax highlighting & colors.
syntax on
colorscheme gruvbox
set background=dark

" Auto indentation.
set autoindent
filetype on
filetype indent on
filetype plugin indent on

set tabstop=4
set shiftwidth=4

" Strip whitespaces on save.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * if &ft =~ 'sh\|c\|cpp\|python\|rust' | :call <SID>StripTrailingWhitespaces() | endif

" Splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" GUI options.
set guioptions=
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set belloff=all

" No timeout PLEASE!
set timeoutlen=0

" Hopefully these settings will render vim faster...
set nocursorline
set lazyredraw

" Spell checking
set spell

" Man pages.
runtime ftplugin/man.vim
let g:ft_man_open_mode = 'vert'

" Vertical helps.
cnoreabbrev H vert h

" Powerline.
py3 from powerline.vim import setup as powerline_setup
py3 powerline_setup()
py3 del powerline_setup
set laststatus=2
"set showtabline=2
set noshowmode

" fzf setup.
set rtp+=/usr/local/opt/fzf

