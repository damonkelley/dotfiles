" Map Leader
let mapleader = "\<Space>"

" Generic Bindings
imap jj <Esc>
no <up> ddkP
no <down> ddp

no <leader>w :w<CR>


" Reset the alt key output for Auto-pairs
set <M-e>=e
set <M-b>=b
set <M-p>=p

" JSON Tidy
noremap <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

map <Leader>k :NERDTreeToggle<CR>

map <Leader>vp :VimuxPromptCommand<CR>

