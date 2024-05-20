" View options by :options"
" Docs on particular option :help <option name>"
" :help key-notation "

set nocompatible
syntax on

nnoremap <SPACE> <Nop>
let mapleader=" "

" --- REMAPS ---
inoremap jk <Esc> " maps the string jj to function as the escape button"
nnoremap <A-Left> <C-O> 
nnoremap <A-Right> <C-I>
" dti<space> can be used to 'dw' (except for line endings) "
nnoremap dw diw
nnoremap cw ciw
nnoremap S :%s///g<Left><Left><Left>
nnoremap <leader>n :nohlsearch<CR>
" nnoremap <SPACE> : ???? "
" nnoremap B :!./build.sh<CR>  ??? "
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h

" --- VISIBLES ---
set number relativenumber
set cursorline " highlights cursor line"
colorscheme torte
:highlight Cursorline cterm=bold ctermbg=black
" set hlsearch " highlight search pattern"
" set nohlsearch " remove highlighting search matches"
set showmatch " shows the matching part of braces"
" does not jump to matching bracket for a sec "
set laststatus=2 " status bar at the bottom"
set noshowmatch

set noerrorbells
set nobackup

set autoindent
" jumps to the current search result when typing "
set incsearch 
set tabstop =2 " tabs in space"
set wildmode=list:full " list all matches for tabs "
set clipboard=unnamedplus " makes it so that 'y' command copies to the default clipboard as well"
set splitbelow " split all windows, including terminal below"

set grepprg=git\ grep\ -n "change grep command to this "

set mouse=a
set redrawtime=10000

" save folding information to a file
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent! loadview
