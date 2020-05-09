" ------------------------------------------
"             Vim Configuration
"                By: ydolev
" ------------------------------------------
" Use bash as the VIM shell.
set shell=/bin/bash
let $SHELL='/bin/bash'

" Syntax highlighting & colors.
syntax on
set background=dark
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set t_Co=256

let g:gruvbox_contrast_dark='hard'
colorscheme yd

" Cursor.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Auto indentation.
set autoindent
filetype on
filetype plugin on
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

autocmd BufWritePre * if &ft =~ 'sh\|c\|cpp\|python' | :call <SID>StripTrailingWhitespaces() | endif

" No backup plz.
set nobackup
set noswapfile

" Use space as the leader key.
nnoremap <SPACE> <Nop>
let mapleader=" "

" Splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" No timeout PLEASE!
set notimeout
set ttimeout
set ttimeoutlen=0

" Spell checking
set spell

" Man pages.
runtime ftplugin/man.vim
let g:ft_man_open_mode = 'vert'

" Vertical helps.
cnoreabbrev H vert h

" Wildmenu.
set wildmenu
set wildmode=full

" Jump to tag key mappings.
nnoremap <C-w>] :vert winc ]<CR>
nnoremap <C-w><C-]> :vert winc ]<CR>
nnoremap <C-w>[ :winc ]<CR>
nnoremap <C-w><C-[> :winc ]<CR>

" Powerline.
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
"set laststatus=2
""set showtabline=2
"set noshowmode

" GUI options.
set guioptions=
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set belloff=all

" ------------------------------------------
"                  Plugins    
" ------------------------------------------
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vim/vimrc
endif

" Begin plugin setup.
call plug#begin('~/.vim/plugged')

" Language packs.
Plug 'sheerun/vim-polyglot'

" vim-airline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_section_warning=''

" Ack (using The Silver Searcher).
Plug 'mileszs/ack.vim'
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" fzf.
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

" Tagbar.
Plug 'majutsushi/tagbar'
nnoremap <F2> :TagbarToggle<cr>

" Undo Tree.
Plug 'mbbill/undotree'
nnoremap <F3> :UndotreeToggle<cr>

" Rust.
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Web API.
Plug 'mattn/webapi-vim'

" Autotag.
Plug 'craigemery/vim-autotag'

" Easy Align.
Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" commentary.vim.
Plug 'tpope/vim-commentary'

" Ultisnips.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" End plugin setup
call plug#end()

" ------------------------------------------
"       Neovim Specific Configuration    
" ------------------------------------------
if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
 
