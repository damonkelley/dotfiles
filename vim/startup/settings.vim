set nocompatible
set encoding=utf-8
set nobackup    " no backup files
set backspace=indent,eol,start
set visualbell
set showcmd

syntax enable
set cc=80
set ls=2            " always show status line


" Tabs
set tabstop=4       " size of a hard tabstop
set shiftwidth=4    " size of an "indent"
set softtabstop=4   " a combination of spaces and tabs are used to simulate tab stops at a width
                    " other than the (hard)tabstop
set smarttab        " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab       " always uses spaces instead of tab characters

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set number

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•

" Folding
set foldmethod=syntax
set foldlevelstart=20

au FileType javascript set ts=2 softtabstop=2 sw=2
au FileType htmldjango set ts=4 softtabstop=4 sw=4

" Cursor settings
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
