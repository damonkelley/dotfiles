" vim:fdm=marker

" Plugins {{{
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'TimUntersberger/neogit'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise', {'for': ['elixir', 'ruby']}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'

Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-scripts/bats.vim'
Plug 'janko-m/vim-test'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go'

Plug 'chriskempson/base16-vim'
" Plug 'morhetz/gruvbox'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim', {'branch': 'main'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
"}}}

" Basic Settings {{{
if !has('nvim')
  set nocompatible
  set encoding=utf-8
endif

syntax enable
set cc=80
set ls=2  " always show status line
set showcmd
if exists('&belloff')
  set belloff=all
endif

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

set nowrap

" searching
set hlsearch
set ignorecase
set smartcase

" line numbers
set number
if exists('&relativenumber')
  set relativenumber
endif

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•
set exrc

set completeopt-=preview

if exists('&inccommand')
  set inccommand=split
endif

set hidden
"}}}

" Tags {{{
set tags+=.git/tags

function! TagComplete(id, code, event)
  echohl DiffAdd | echo "Tagging complete" | echohl None
endfunction

function! ReTag()
    let l:cmd = "ctags --tag-relative=yes -Rf.git/tags"
    let l:opts = {'on_exit': 'TagComplete'}

    call jobstart(l:cmd, l:opts)
endfunction
" }}}

" Neovim {{{
if has('nvim')
  let g:python3_host_prog='/usr/local/bin/python3'
  let g:python_host_prog='/usr/local/bin/python'
endif
"}}}

" File Type Settings {{{
augroup filetypesettings
  autocmd!
  au filetype javascript setlocal ts=2 softtabstop=2 sw=2
  au filetype htmldjango setlocal ts=4 softtabstop=4 sw=4
  au filetype vim setlocal ts=2 softtabstop=2 sw=2
  au filetype elixir setlocal foldmethod=syntax foldlevel=20
  au filetype elixir nnoremap <leader>tr :silent exec '!tmux send-keys -r -t 1 "mix test" enter' <Bar> redraw!<CR>
  au filetype ruby setlocal ts=2 sw=2 softtabstop=2
  au filetype markdown setlocal spell
  au filetype clojure setlocal lispwords+=describe,context,it,around,should-invoke
  au cmdwinenter * setlocal cc=0 nonumber norelativenumber
  autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup end
"}}}

" Colors {{{
if exists('&termguicolors')
  set termguicolors
endif

let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'hard'

set background=dark
colorscheme gruvbox
highlight search cterm=underline ctermfg=214 gui=underline guifg=#fabd2f
" }}}

" completion {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Mappings {{{
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Generic Bindings
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>lv :vsplit .nvimrc<CR>
nnoremap <leader>et :vsplit ~/.tmux.conf<CR>
cnoremap <C-A> <HOME>
nnoremap <leader>w :w<CR>

nnoremap <Leader>rt :call ReTag()<CR>

" Search for word under the cursor
nnoremap <silent> <leader>* :Rg! <C-R><C-W><CR>
nnoremap <leader>/ :Rg!

" Always use very magic searches
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>\ :noh<CR>

let g:test#preserve_screen = 0
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>


" Neovim Terminal
if has('nvim')
  tnoremap <c-\> <c-\><c-n>

  augroup myterminal
    au TermOpen * setlocal nonumber norelativenumber
  augroup END
endif


" VCS
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gt :GitGutterLineHighlightsToggle<CR>

" JSON Tidy
noremap <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" FZF

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <leader>fa :ProjectFiles<CR>
nnoremap <leader>fr :GFiles<CR>
nnoremap <leader>mf :GFiles?<CR>
nnoremap <leader>b :Buffers<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" easy align
xmap ga <plug>(easyalign)
nmap ga <plug>(easyalign)

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

" Other Files {{{
source ~/.config/nvim/statusline.vim
"}}}

" Whitespace {{{
function! MatchTrailingWhitespace()
  call matchadd('Error', '\v\s+$')
endfunction

augroup whitespace_detect
  autocmd!
  au BufEnter * :call MatchTrailingWhitespace()
augroup END
"}}}

" Terraform {{{
let g:terraform_fmt_on_save=1
let g:terraform_align=1
"}}}

lua <<EOF
  require 'treesitter'
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
