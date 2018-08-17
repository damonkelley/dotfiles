" function! neoformat#formatters#clojure#enabled() abort
"     return ['{{ formatter name }}', '{{ other formatter name for filetype }}']
" endfunction

" function! neoformat#formatters#clojure#{{ formatter name }}() abort
"     return {
"         \ 'exe': 'lein ',
"         \ 'args': ['-s 4', '-q'],
"         \ 'stdin': 1
"         \ }
"   endfunction
