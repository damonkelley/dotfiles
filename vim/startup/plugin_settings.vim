" Airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" NERDTree config {
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Indent Guide
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" PHP Fold Settings
let g:php_folding = 2

" GitGutter

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let g:syntastic_python_checkers = ["python", "flake8"]
let g:syntastic_php_checkers = ["php"]
