let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tt'
let g:neoterm_raise_when_tests_fail=1
let g:neoterm_close_when_tests_succeed=1
let g:neoterm_size=13

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

nnoremap <silent> <leader>ta :call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>tf :call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>tn :call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>tr :call neoterm#test#rerun()<cr>

nnoremap <silent> <leader>th :call neoterm#close()<cr>
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
nnoremap <silent> <leader>to :call neoterm#open()<cr>
