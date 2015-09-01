color gruvbox
if g:uname == "Darwin\n"
    let g:gruvbox_italic=0 " OSX setting
endif

let g:gruvbox_sign_column = 'dark0'

set background=dark

if &term =~ '^rxvt-unicode'
    hi Comment cterm=italic
endif

set t_Co=256   " 256 colors
set t_ut=      " Use the current background color | Resolves issues with tmux
