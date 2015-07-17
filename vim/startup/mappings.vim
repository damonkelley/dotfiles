" Map Leader
let mapleader = "\<Space>"

" Generic Bindings
imap jk <Esc>
imap kj <Esc>
no <up> ddkP
no <down> ddp

no <leader>w :w<CR>


" Reset the alt key output for Auto-pairs
set <M-e>=e
set <M-b>=b
set <M-p>=p

" JSON Tidy
noremap <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <leader>vs vip<leader>vs<CR>

" Unite.vim
nnoremap <leader>/ :Unite grep:.<CR>
nnoremap <leader>y :Unite history/yank<CR>
nnoremap <leader>r :<C-u>Unite -resume -start-insert -auto-resize file_rec/async<CR>
nnoremap <leader>f :<C-u>Unite -resume -auto-resize file<CR>
nnoremap <leader>b :Unite buffer bookmark<CR>

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>pr"
