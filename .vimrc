" iew options by :options"
" Docs on particular option :help <option name>"
" :help key-notation "

set nocompatible
syntax on

nnoremap <SPACE> <Nop>
let mapleader=" "

" --- REMAPS --- "
" default bindings:
" :help normal-index
" :help insert-index
" :help visual-index
" remaps: :[n,i,v]map

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

" --- VISIBLES --- "
set number relativenumber
set cursorline " highlights cursor line"
colorscheme torte
highlight Cursorline cterm=bold ctermbg=black
" set hlsearch " highlight search pattern"
" set nohlsearch " remove highlighting search matches"
" does not jump to matching bracket for a sec "
set noshowmatch

" --- STATUS LINE --- "
" help: statusline
set laststatus=2 " status bar at the bottom"
highlight StatusLineModeNormal   ctermfg=white ctermbg=brown     cterm=bold
highlight StatusLineModeInsert   ctermfg=white ctermbg=darkblue  cterm=bold
highlight StatusLineModeReplace  ctermfg=white ctermbg=red       cterm=bold
highlight StatusLineModeVisual   ctermfg=white ctermbg=darkgreen cterm=bold
highlight StatusLineModeCommand  ctermfg=white ctermbg=yellow    cterm=bold
highlight StatusLineModeSelect   ctermfg=white ctermbg=cyan      cterm=bold
highlight StatusLineModeTerminal ctermfg=white ctermbg=black     cterm=bold
highlight StatusLineModeUnknown  ctermfg=white ctermbg=grey      cterm=bold

function Moode()
	let l:mode = mode()
	if l:mode == 'n'
		return '%#StatusLineModeNormal# NORMAL %#StatusLine#'
	elseif l:mode == 'i'
		return '%#StatusLineModeInsert# INSERT %#StatusLine#'
	elseif l:mode == 'R'
		return '%#StatusLineModeReplace# REPLACE %#StatusLine#'
	elseif l:mode == 'v'
		return '%#StatusLineModeVisual# VISUAL %#StatusLine#'
	elseif l:mode == 'V'
		return '%#StatusLineModeVisual# V-LINE %#StatusLine#'
	elseif l:mode == '^V'
		return '%#StatusLineModeVisual# V-BLOCK %#StatusLine#'
	elseif l:mode == 'c'
		return '%#StatusLineModeCommand# COMMAND %#StatusLine#'
	elseif l:mode == 's'
		return '%#StatusLineModeSelect# SELECT %#StatusLine#'
	elseif l:mode == 'S'
		return '%#StatusLineModeSelect# S-LINE %#StatusLine#'
	elseif l:mode == '^S'
		return '%#StatusLineModeSelect# S-BLOCK %#StatusLine#'
	elseif l:mode == 't'
		return '%#StatusLineModeTerminal# TERMINAL %#StatusLine#'
	else
		return '%#StatusLineModeUnknown# UNKNOWN %#StatusLine#'
	endif
endfunction

set statusline=%{%Moode()%}\ %t\ %m%r%=%l/%L:%v\ %p%%\ 

" --- OTHER --- "

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


