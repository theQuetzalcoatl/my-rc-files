" view options by :options"
" Docs on particular option :help <option name>"
" :help key-notation "

set nocompatible
syntax on
" filetype - everything else builds on this
" plugin - loads *filetype plugins* (`$VIMRUNTIME/ftplugin/c.vim`). These are little scripts Vim ships that set sensible per-language defaults. For C, that ftplugin sets things like comment strings, `formatoptions`, and `matchit` support automatically.
" indent - loads *indent scripts* (`$VIMRUNTIME/indent/c.vim`), which know how to indent that specific language correctly.
filetype plugin indent on
set path+=**
nnoremap <SPACE> <Nop>

let mapleader=" "

" --- REMAPS --- "
" default bindings:
" :help normal-index
" :help insert-index
" :help visual-index
" remaps: :[n,i,v]map


" make spaced word into snake case "
" nnoremap <leader>r Bhr_
" maps the string hh to function as the escape button"
inoremap hh <Esc>
inoremap HH <Esc>
nnoremap <Esc>h <C-O>
nnoremap <Esc>l <C-I>
" it deletes every character between spaces "
" "noremap dw diw 
nnoremap yw yiw
nnoremap cw ciw
nnoremap vw viw
" de is delete and move to the end of the word --> not used
nnoremap de d$
nnoremap ce c$
nnoremap S :%s///g<Left><Left><Left>
vnoremap S :s///g<Left><Left><Left>
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
inoremap {<cr> {<cr><cr>}<Up>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap #def #define<space>
inoremap #inC #include <.h><Left><Left><Left>
inoremap #Inc #include ".h"<Left><Left><Left>
nnoremap <silent> <leader>r A<space>/* NOTE: refactor */<Esc>
nnoremap <silent> <leader>c :s/^/\/\//<cr> :nohlsearch<cr> " comment line
nnoremap <silent> <leader>u :s/^\/\///<cr> " uncomment line
vnoremap <silent> <leader>c :s/^/\/\//<cr> :nohlsearch<cr> " comment line
vnoremap <silent> <leader>u :s/^\/\///<cr> " uncomment line
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <
" make compiler errors searchable by dropping them into the quickfix list "
set makeprg=./build.sh
nnoremap <leader>b :make<cr>
nnoremap <silent> <A-Down> :cnext<cr>
nnoremap <silent> <A-Up> :cprev<cr>
nnoremap é $
vnoremap é $
" if im in main.c it issues: :find main. --> so i can just type 'h' and go to the header "
nnoremap <leader>h :find %:t:r.h<cr>
" Vim uses real regex "
" +,?,() -- are now regexes"
nnoremap / /\v
" folding in visual mode "
xnoremap <C-h> zf

" using K, it shows the manpage in a different, buffer window rather than switching to a new one
runtime ftplugin/man.vim
autocmd FileType c,cpp setlocal keywordprg=:Man
" Auto regenerate ctags on saving the buffer
autocmd BufWritePost *.c,*.h silent! !ctags -R . &

command! Hexmode :%!xxd
" DO NOT FORGET TO USE THIS COMMAND BEFORE SAVING THE HEX CONTENT "
command! Binarymode :%!xxd -r

" --- NETRW --- "
" Set Netrw to open in tree view by default
" let g:netrw_liststyle = 3
" remaps 'l' to 'Enter' and 'h' to '-' when using netrw "
autocmd FileType netrw map <buffer> l <cr>
autocmd FileType netrw map <buffer> h -


" --- VISIBLES --- "

" <C-x><C-o> = omni completion, SETS  <C-x><C-]> = tag completion
set omnifunc=syntaxcomplete#Complete
set number relativenumber
set cursorline " enables 'highlight CursorLine -- cterm=NONE removes the underscoring "
" if nord is missing the error is swallowed "
silent! colorscheme  nord  
   

" is Vim's dedicated C indentation engine
" - `:0 — case labels in a switch get 0 extra indent relative to the switch (aligned under it, not indented further).
" - l1 — code after a case label aligns with the label.
" - t0 — a function's return type on its own line gets 0 indent.
" - (0 — when you break inside unclosed parentheses, line up with the character after the `(` instead of adding a big indent.
" - `W4` — but if the `(` is the last thing on the line, indent continuation by 4 instead.
" applies the setting only to the current buffer, and the `FileType` autocommand fires it only for C/C++ files.
augroup c_indent
  autocmd!
  autocmd FileType c,cpp setlocal cindent cinoptions=:0,l1,t0,(0,W4
augroup END

" status line is not overwritten on -S session entry
set sessionoptions-=localoptions

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
highlight StatusLineModeInsert   guibg=#0760a9 guifg=#151B1E cterm=bold
highlight StatusLineModeReplace  guibg=#dff708 guifg=#151B1E cterm=bold
highlight StatusLineModeVisual   guibg=#2a7a53 guifg=#151B1E cterm=bold
highlight StatusLineModeCommand  guibg=#6c01ff guifg=#151B1E cterm=bold
highlight StatusLineModeTerminal guibg=#bb002d guifg=#151B1E cterm=bold
highlight StatusLineModeUnknown  guibg=#000000 guifg=#151B1E cterm=bold

highlight StatusLineFileNormal   guibg=#000000 guifg=#ffa800 cterm=bold
highlight StatusLineFileInsert   guibg=#000000 guifg=#0760a9 cterm=bold
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
	elseif l:mode == "\<C-v>"
		return '%#StatusLineModeVisual# V-BLOCK %#StatusLineFileVisual# %t'
	elseif l:mode == 'c'
		return '%#StatusLineModeCommand# COMMAND %#StatusLineFileCommand# %t'
	elseif l:mode == 't'
		return '%#StatusLineModeTerminal# TERMINAL %#StatusLineFileTerminal# %t'
	else
		return '%#StatusLineModeUnknown# UNKNOWN %#StatusLine#' " %#StatusLine#' restores the original colors
    endif
endfunction

set statusline=%{%Mode_File()%}\ %m%r%=(%v,%l/%L)\ \ %p%%\ 

" --- OTHER --- "
set noerrorbells
set nobackup
set noswapfile

set foldlevelstart=99 " all fold open by default

set autoindent
set tabstop=4 " tabs in space "
set shiftwidth=4 " V mode indents X spaces "
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
