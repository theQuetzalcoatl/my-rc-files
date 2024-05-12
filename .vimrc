" View options by :options"
" Docs on particular option :help <option name>"
" :help key-noation "

inoremap jk <Esc> " maps the string jj to function as the escape button"
noremap <A-Left> <C-O> 
noremap <A-Right> <C-I>

set number relativenumber
set mouse=a
set redrawtime=10000
set noerrorbells
set nobackup
set cursorline " highlights cursor line"
:highlight Cursorline cterm=bold ctermbg=black

syntax on

set hlsearch " highlight search pattern"
set incsearch " highlights searches as I type, not after I hit enter"
set autoindent
set tabstop =2 " tabs in space"
set showmatch " shows the matching part of braces"
set wildmode=list:full " list all matches for tabs "
set laststatus=2 " status bar at the bottom"
set clipboard=unnamedplus " makes it so that 'y' command copies to the default clipboard as well"
set splitbelow " split all windows, including terminal below"

nnoremap S :%s///g<Left><Left><Left>
