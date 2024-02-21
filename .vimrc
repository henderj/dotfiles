" Set leader to ,
let mapleader = ","

" Change default cursor style
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of files
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the dtected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift witdth to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" While searching through a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000



" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave similar to Bash completion.
set wildmode=list:longest

" Ignore files that we don't want to edit with vim.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

filetype plugin on
set omnifunc=syntaxcomplete#Complete


" PLUGINS -------------------------------------------------- {{{

" if empty(glob('~/.vim/autoload/plug.vim'))
    " silent execut '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" Plugin code goes here.

" call plug#begin('~/.vim/plugged')

" Plug 'altercation/vim-colors-solarized'
" Plug 'NLKNguyen/papercolor-theme'

" call plug#end()

" }}}


" MAPPINGS ------------------------------------------------- {{{

" Mappings code goes here.

inoremap jk <esc>
inoremap <C-Space> <C-x><C-o>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <leader>p "*p
nnoremap <space> za
nnoremap <leader>a ggVG

vnoremap <leader>y "*y
vnoremap <leader>v "*v

" }}}


" VIMSCRIPT ------------------------------------------------ {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ---------------------------------------------- {{{

" Status bar code goes here.

" }}}

set t_Co=256

set background=dark
" colorscheme molokai
