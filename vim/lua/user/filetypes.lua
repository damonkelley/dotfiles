vim.cmd([[
augroup filetypesettings
  autocmd!
  au filetype javascript setlocal ts=2 softtabstop=2 sw=2
  au filetype vim setlocal ts=2 softtabstop=2 sw=2
  au filetype elixir setlocal foldmethod=syntax foldlevel=20
  au filetype elixir nnoremap <leader>tr :silent exec '!tmux send-keys -r -t 1 "mix test" enter' <Bar> redraw!<CR>
  au filetype ruby setlocal ts=2 sw=2 softtabstop=2
  au filetype markdown setlocal spell
  au filetype clojure setlocal lispwords+=describe,context,it,around,should-invoke
  au filetype lua setlocal sw=2
  au cmdwinenter * setlocal cc=0 nonumber norelativenumber
  autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup end
]])
