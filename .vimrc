" view options by :options"
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

inoremap hh <Esc> " maps the string hh to function as the escape button"
inoremap HH <Esc>
nnoremap <Esc>h <C-O> 
nnoremap <Esc>l <C-I>
" it deletes every character between spaces "
nnoremap dw diw 
nnoremap yw yiw 
nnoremap cw ciw
nnoremap vw viw
" de is delete and move to the end of the word --> not used
nnoremap de d$
nnoremap ce c$
nnoremap S :%s///g<Left><Left><Left>
nnoremap <silent> <leader>n :nohlsearch<cr>
nnoremap <silent> <Esc>a :tabp<cr> 
nnoremap <silent> <Esc>d :tabn<cr>
inoremap <silent> <Esc>a <Esc>:tabp<cr>i
inoremap <silent> <Esc>d <Esc>:tabn<cr>i
" It's a remap which i dont use
nnoremap , :
" window resizeing 'silent' supresses command line output "
nnoremap <silent> <leader>k :resize -4<cr>
nnoremap <silent> <leader>j :resize +4<cr>
nnoremap <silent> <leader>h :vertical resize -4<cr>
nnoremap <silent> <leader>l :vertical resize +4<cr>
nnoremap <silent> <leader>e :Explore<cr>
nnoremap <silent> <leader>v :Vexplore<cr>
nnoremap <silent> <leader>t :Texplore<cr>
nnoremap <silent> <leader>L :Lexplore<cr> :vertical resize 30<cr>
nnoremap <leader>f :find<Space>
" move highlighted blocks of code up and down + indent accordingly , NOTE: <A-j> does not work because the OS does not recognize it or smth. 
vnoremap <silent> <Esc>j :m '>+1<cr>gv=gv
vnoremap <silent> <Esc>k :m '<-2<cr>gv=gv
nnoremap <silent> <Esc>k :m .-2<cr>==
nnoremap <silent> <Esc>j :m .+1<cr>==
" search matches at screen center
nnoremap n nzz
nnoremap N Nzz
inoremap /* /*  */<Left><Left><Left>
inoremap {<space> {<cr><cr>}<Up>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap #deF #define<space>
inoremap #inC #include <.h><Left><Left><Left>
inoremap #Inc #include ".h"<Left><Left><Left>
nnoremap <silent> <leader>c :s/^/\/\//<cr> :nohlsearch<cr> " comment line
nnoremap <silent> <leader>u :s/^\/\///<cr> " uncomment line
vnoremap <silent> <leader>c :s/^/\/\//<cr> :nohlsearch<cr> " comment line
vnoremap <silent> <leader>u :s/^\/\///<cr> " uncomment line
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <
nnoremap <leader>b :!clear; ./build.sh<cr>
nnoremap <silent> <A-Down> :cnext<cr>
nnoremap <silent> <A-Up> :cprev<cr>
nnoremap é $
vnoremap é $
" alternative saving "
nnoremap <leader>w :update<cr>

command! Hexmode :%!xxd
" DO NOT FORGET TO USE THIS COMMAND BEFORE SAVING THE HEX CONTENT "
command! Binarymode :%!xxd -r

" --- CTAGS --- "
" ctags -R
" Ctr + ] to go to definition
" Ctrl + t to go to previously visited definitions

" --- NETRW --- "
" Set Netrw to open in tree view by default
" let g:netrw_liststyle = 3
" remaps 'l' to 'Enter' and 'h' to '-' when using netrw "
autocmd FileType netrw map <buffer> l <cr>
autocmd FileType netrw map <buffer> h -


" --- VISIBLES --- "
set number relativenumber
set cursorline " enables 'highlight CursorLine -- cterm=NONE removes the underscoring"
colorscheme  mustang
" colorscheme  alduin
" colorscheme  iceberg
" colorscheme  nordic-aurora 
" colorscheme  dark_plus  
   
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

" --- OTHER --- "
set noerrorbells
set nobackup
set noswapfile

set foldmethod=syntax " zc - fold, zo - open, zR - open all folds
set foldlevelstart=99 " all fold open by default

set autoindent
" set cindent
set smartindent
set tabstop =2 " tabs in space "
set shiftwidth=2 " V mode indents 2 spaces "
set expandtab " use spaces for tabs "
set incsearch " jumps to the current search result when typing "
set wildmode=list:full " list all matches for tabs "
set clipboard=unnamedplus " makes it so that 'y' command copies to the default clipboard as well"
set splitbelow " split all windows, including terminal below"

set list
set listchars=tab:»·,trail:·
" hide tabs, spaces "
set list!

set grepprg=git\ grep\ -n "change grep command to this "

set mouse=a
set redrawtime=10000
