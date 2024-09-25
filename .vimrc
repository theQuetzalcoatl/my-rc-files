" iew options by :options"
" Docs on particular option :help <option name>"
" :help key-notation "

set nocompatible
syntax on
set path+=**

nnoremap <SPACE> <Nop>
let mapleader=" "

" --- REMAPS --- "
" default bindings:
" :help normal-index
" :help insert-index
" :help visual-index
" remaps: :[n,i,v]map

inoremap jk <Esc> " maps the string jj to function as the escape button"
inoremap JK <Esc>
nnoremap <A-Left> <C-O> 
nnoremap <A-Right> <C-I>
" it deletes every character between spaces "
nnoremap dw diw 
nnoremap cw ciw
" de is delete and move to the end of the word --> not used
nnoremap de d$
nnoremap ce c$
nnoremap S :%s///g<Left><Left><Left>
nnoremap <silent> <leader>n :nohlsearch<cr>
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <silent> <Esc>a :tabp<cr> 
inoremap <silent> <Esc>a <Esc>:tabp<cr>i
nnoremap <silent> <Esc>d :tabn<cr>
inoremap <silent> <Esc>d <Esc>:tabn<cr>i
" It's a remap which i dont use
nnoremap , :
" window resizeing i'silent' supresses command line output "
nnoremap <silent> <Space><Up>    :resize -4<cr>
nnoremap <silent> <Space><Down>  :resize +4<cr>
nnoremap <silent> <Space><Left>  :vertical resize -4<cr>
nnoremap <silent> <Space><Right> :vertical resize +4<cr>
nnoremap <silent> <leader>e :Explore<cr>
nnoremap <silent> <leader>v :Vexplore<cr>
nnoremap <silent> <leader>t :Texplore<cr>
nnoremap <silent> <leader>l :Lexplore<cr> :vertical resize 30<cr>
nnoremap <leader>f :find<Space>
" move highlighted blocks of code up and down + indent accordingly 
vnoremap <silent> <A-Down> :m '>+1<cr>gv=gv
vnoremap <silent> <A-Up> :m '<-2<cr>gv=gv
nnoremap <silent> <A-Up> :m .-2<cr>==
nnoremap <silent> <A-Down> :m .+1<cr>==

" --- NETRW --- "
" Set Netrw to open in tree view by default
" let g:netrw_liststyle = 3


" --- VISIBLES --- "
set number relativenumber
set cursorline " highlights cursor line"
colorscheme  nordic-aurora " dark_plus plastic mochalatte
   
set hlsearch " highlight search pattern"
" set nohlsearch " remove highlighting search matches"
" does not jump to matching bracket for a sec "
set noshowmatch

" --- STATUS LINE --- "
" help: statusline
" current settings for a highlight group -> :highlight <group>
set laststatus=2 " status bar at the bottom"
if has("termguicolors")
    set termguicolors
endif

highlight StatusLineModeNormal   guibg=#ffa800 guifg=#151B1E cterm=bold
highlight StatusLineModeInsert   guibg=#2e87d1 guifg=#151B1E cterm=bold
highlight StatusLineModeReplace  guibg=#dff708 guifg=#151B1E cterm=bold
highlight StatusLineModeVisual   guibg=#2a7a53 guifg=#151B1E cterm=bold
highlight StatusLineModeCommand  guibg=#6c01ff guifg=#151B1E cterm=bold
highlight StatusLineModeTerminal guibg=#bb002d guifg=#151B1E cterm=bold
highlight StatusLineModeUnknown  guibg=#000000 guifg=#151B1E cterm=bold

highlight StatusLineFileNormal   guibg=#000000 guifg=#ffa800 cterm=bold
highlight StatusLineFileInsert   guibg=#000000 guifg=#2e87d1 cterm=bold
highlight StatusLineFileReplace  guibg=#000000 guifg=#dff708 cterm=bold
highlight StatusLineFileVisual   guibg=#000000 guifg=#2a7a53 cterm=bold
highlight StatusLineFileCommand  guibg=#000000 guifg=#6c01ff cterm=bold
highlight StatusLineFileTerminal guibg=#000000 guifg=#bb002d cterm=bold
highlight StatusLineFileUnknown  guibg=#000000  cterm=bold

function Mode_File()
	let l:mode = mode()
	if l:mode == 'n'
		return '%#StatusLineModeNormal# NORMAL %#StatusLineFileNormal# %t'
	elseif l:mode == 'i'
		return '%#StatusLineModeInsert# INSERT %#StatusLineFileInsert# %t'
	elseif l:mode == 'R'
		return '%#StatusLineModeReplace# REPLACE %#StatusLineFileReplace# %t'
	elseif l:mode == 'v'
		return '%#StatusLineModeVisual# VISUAL %#StatusLineFileVisual# %t'
	elseif l:mode == 'V'
		return '%#StatusLineModeVisual# V-LINE %#StatusLineFileVisual# %t'
	elseif l:mode == '^V'
		return '%#StatusLineModeVisual# V-BLOCK %#StatusLineFileVisual# %t'
	elseif l:mode == 'c'
		return '%#StatusLineModeCommand# COMMAND %#StatusLineFileCommand# %t'
	elseif l:mode == 't'
		return '%#StatusLineModeTerminal# TERMINAL %#StatusLineFileTerminal# %t'
	else
		return '%#StatusLineModeUnknown# UNKNOWN %#StatusLine#' " %#StatusLine#' restores the original colors
endfunction

set statusline=%{%Mode_File()%}\ %m%r%=(%v,%l/%L)\ \ %p%%\ 
" TODO: change cursorline BG color according to mode "


" --- OTHER --- "
set noerrorbells
set nobackup
set noswapfile

set autoindent
set tabstop =2 " tabs in space"
set shiftwidth=2 " V mode indents 2 spaces "
set expandtab " use spaces for tabs "
" jumps to the current search result when typing "
set incsearch 
set wildmode=list:full " list all matches for tabs "
set clipboard=unnamedplus " makes it so that 'y' command copies to the default clipboard as well"
set splitbelow " split all windows, including terminal below"

set grepprg=git\ grep\ -n "change grep command to this "

set mouse=a
set redrawtime=10000

" iabbrev <something> "

