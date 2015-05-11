" Airline config
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1

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

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(app/cache\/$|vendor\/$\)')
call unite#custom#alias('file', 'delete', 'vimfiler__delete')
let g:unite_source_history_yank_enable = 1

if executable('ag')
    let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()
autocmd FileType unite highlight CursorLine ctermbg=darkblue ctermfg=yellow

function! s:unite_settings()
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction
