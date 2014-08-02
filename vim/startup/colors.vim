" Gruvbox config ======= {{{
" color gruvbox
" if g:uname == "Darwin\n"
"     let g:gruvbox_italic=0 " OSX setting
" endif
" }}}

" Solarized config ======= {{{
" color solarized
" let g:solarized_termtrans=1
" }}}

" Hybrid ======= {{{
color hybrid
if g:uname == "Darwin\n"
    let g:hybrid_use_iTerm_colors=1 " OSX setting
else
    let g:hybrid_use_Xresources = 1
    hi Comment cterm=italic
endif
"}}}

" Background ======= {{{
set background=dark
" set background=light
" }}}

set t_Co=256   " 256 colors
set t_ut=      " Use the current background color | Resolves issues with tmux
