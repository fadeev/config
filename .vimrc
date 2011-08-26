set nocompatible   " No compatibility with Vi

set ignorecase     " Case insensitive search
set smartcase      " Capitalisation leads to case sensitivity
set incsearch      " Incremental search

set nowrap         " Switch wrap off for everything
set autoindent     " Autoindenting on
set number         " Line numbering
set numberwidth=5  " More space for numbers
syntax enable      " Syntax highlighting
set nobackup       " No filename~ backups
set splitbelow     " New files are placed below current
set wildmenu       " Autocompletion menu, the regular one

set tabstop=2      " Size of tab in spaces
set shiftwidth=2   " How far text is indented using `<<` and `>>`
set expandtab      " Tab is insert mode produces spaces

" The following makes cursor centered (typewriter mode):
:nnoremap j jzz 
:nnoremap k kzz
