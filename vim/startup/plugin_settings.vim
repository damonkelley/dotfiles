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

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

" GitGutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/path/to/python3'
let g:syntastic_python_checkers = ["python", 'pylama']
let g:syntastic_php_checkers = ["php"]
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ["elixir", "mix"]

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(app/cache\/$|vendor\/$\)')
call unite#custom#alias('file', 'delete', 'vimfiler__delete')
let g:unite_source_history_yank_enable = 1

if executable('ag')
    let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--hidden', '-g', '']
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
    let g:unite_source_grep_recursive_opt=''
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

" vim-go settings
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-describe)

au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" Python Settings
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>ru"
let g:jedi#completions_command = "<C-x><C-o>"
autocmd FileType python setlocal completeopt-=preview

let ropevim_vim_completion = 0
let ropevim_extended_completion = 0

" Python refactoring settings
let g:jedi#rename_command = "<leader>rr"
au FileType python map <Leader>rem :RopeExtractMethod<CR>
au FileType python map <Leader>rev :RopeExtractVariable<CR>
au FileType python map <Leader>rmv :RopeMove<CR>
au FileType python :compiler pytest


let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tt'
let g:neoterm_raise_when_tests_fail=1
let g:neoterm_close_when_tests_succeed=1
let g:neoterm_run_tests_bg=1
let g:neoterm_size=20

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> <leader>ta :call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>tf :call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>tn :call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>tr :call neoterm#test#rerun()<cr>

set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*



" Useful maps
" hide/close terminal
nnoremap <silent> <leader>th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
