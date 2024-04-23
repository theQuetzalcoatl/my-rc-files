set number relativenumber
set mouse=a

set cursorline "highlights cursor line"
:highlight Cursorline cterm=bold ctermbg=black


syntax on

set hlsearch "highlight search pattern"
set incsearch "highlights searches as I type, not after I hit enter"

set autoindent
set tabstop =2 "tabs in space"
set showmatch "shows the maching part of braces"

set laststatus=2 "status bar at hte bottom"

set clipboard=unnamedplus "makes it so that 'y' command copies to the default clipboard as well"

"set splitbelow splitright"
nnoremap S :%s//g<Left><Left> "remaps 'S' to expand to global replace"
