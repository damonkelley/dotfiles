" Airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" NERDTree config {
    map <C-k><C-k> :NERDTreeToggle<CR>

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

