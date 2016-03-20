augroup GoMappings
  au FileType go nmap <leader>gr <Plug>(go-run)
  au FileType go nmap <leader>gb <Plug>(go-build)
  au FileType go nmap <leader>gt <Plug>(go-test)
  au FileType go nmap <leader>gc <Plug>(go-coverage)
  au FileType go nmap <leader>gi <Plug>(go-info)
  au FileType go nmap <leader>gd <Plug>(go-describe)

  au FileType go nmap <Leader>gds <Plug>(go-def-split)
  au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
