" Generic Bindings
imap jj <Esc>
no <up> ddkP
no <down> ddp

" Reset the alt key output for Auto-pairs
set <M-e>=e
set <M-b>=b
set <M-p>=p

" JSON Tidy
noremap <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

map <C-k><C-k> :NERDTreeToggle<CR>

map <Leader>vp :VimuxPromptCommand<CR>
