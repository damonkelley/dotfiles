if exists(":Neomake")
  let g:neomake_open_list = 2
  autocmd! BufWritePost * Neomake
endif
