if exists(":Neomake")
  let g:neomake_open_list = 0
  autocmd! BufWritePost * Neomake
endif

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_haskell_enabled_makers = ['hlint']
