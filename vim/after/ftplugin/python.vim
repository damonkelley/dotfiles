if exists(':JediDebugInfo')
  let g:jedi#goto_command = "<leader>d"
  let g:jedi#goto_assignments_command = "<leader>g"
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>ru"
  autocmd FileType python setlocal completeopt-=preview
endif

" Python refactoring settings
if exists(":RopeRename")
  augroup python_rope
    let ropevim_vim_completion = 0
    let ropevim_extended_completion = 0
    au FileType python map <Leader>rem :RopeExtractMethod<CR>
    au FileType python map <Leader>rev :RopeExtractVariable<CR>
    au FileType python map <Leader>rmv :RopeMove<CR>
  augroup END
endif

augroup filetype_python_test
  au FileType python :compiler pytest
  au FileType python map <Leader>tf :TestFile<CR>
  au FileType python map <Leader>tr :TestLast<CR>
  au FileType python map <Leader>ta :TestSuite<CR>
  au FileType python map <Leader>tn :TestNearest<CR>
  au FileType python let test#strategy = 'dispatch'
augroup END
