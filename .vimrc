" ------------------------------------------
"             Vim Configuration
"                By: ydolev
" ------------------------------------------

" Do not apply the rest of the vimrc if Neovim is running
" inside the VSCode Neovim extension.
if exists('g:vscode')
    finish
endif

" Use bash as the VIM shell.
set shell=/bin/bash
let $SHELL='/bin/bash'

" Syntax highlighting & colors.
syntax on
colorscheme gruvbox

" Cursor.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Auto indentation.
filetype indent on
filetype plugin on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent

" Show commands.
set showcmd

" Strip whitespaces on save.
" function TrimWhiteSpace()
" 	let l = line(".")
" 	let c = col(".")
" 	%s/\s*$//
" 	''
" 	call cursor(l, c)
" endfunction

" autocmd FileWritePre * call TrimWhiteSpace()
" autocmd FileAppendPre * call TrimWhiteSpace()
" autocmd FilterWritePre * call TrimWhiteSpace()
" autocmd BufWritePre * call TrimWhiteSpace()

" map <F2> :call TrimWhiteSpace()<CR>
" map! <F2> :call TrimWhiteSpace()<CR>

" Please make vim render faster PLEASE!
set ttyfast
set lazyredraw

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

" GUI options.
set guioptions=
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15
set belloff=all

" ------------------------------------------
"              Operating Systems
" ------------------------------------------
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

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

" " Language packs.
let g:polyglot_disabled = ["autoindent"]
Plug 'sheerun/vim-polyglot'

" vim-airline.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_section_warning=''

" fzf.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rge call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>f :Files<cr>
nnoremap <leader>s :Rg<cr>
nnoremap <leader>e :Rge<cr>
nnoremap <leader>j :Tags<cr>

" Tagbar.
Plug 'majutsushi/tagbar'
nnoremap <F2> :TagbarToggle<cr>

" Undo Tree.
Plug 'mbbill/undotree'
nnoremap <F3> :UndotreeToggle<cr>

" Rust.
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Autotag.
Plug 'craigemery/vim-autotag'
let g:autotagStartMethod='fork'

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

" zig.vim
Plug 'ziglang/zig.vim'

" swift.vim
Plug 'keith/swift.vim'

" Flutter support.
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" nvim-treesitter.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" End plugin setup
call plug#end()

" Move blocks up and down.
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-k> :m '<-2<CR>gv=gv
vnoremap <S-j> :m '>+1<CR>gv=gv

" Rust ctags.
" autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
" autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" nvim-treesitter configuration.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
EOF

" ------------------------------------------
"                  Neovide
" ------------------------------------------
" Paste in command mode.
cnoremap <c-v> <c-r>+

" Hide mouse while typing.
let g:neovide_hide_mouse_when_typing=1

" ------------------------------------------
"                  Formatting
" ------------------------------------------
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

function! Formatonsave()
  let l:formatdiff = 1

  if "Linux" == g:os
    py3f /usr/local/share/clang/clang-format.py
  elseif "Darwin" == g:os
    py3f /usr/local/Cellar/clang-format/14.0.6/share/clang/clang-format.py
  endif
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
