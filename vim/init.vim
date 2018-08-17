" vim:fdm=marker

" Plugins {{{
call plug#begin()

" Git {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tpope {{{2
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'

" Neovim {{{2
if has('nvim')
  Plug 'neomake/neomake'
  Plug 'sbdchd/neoformat'

  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'clojure-vim/async-clj-omni'
endif
"}}}

" Parenthesis {{{2
Plug 'jiangmiao/auto-pairs'

" Navigations/Project {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Registers/Undo {{{2
Plug 'junegunn/vim-peekaboo'

" Writing {{{2
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'

" Language {{{2
Plug 'damonkelley/python-syntax', {'for': 'python'}

" Elixir
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
" Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'elixir'}
Plug 'tpope/vim-endwise', {'for': ['elixir', 'ruby']}

"Clojure
Plug 'venantius/vim-cljfmt'
let g:clj_fmt_autosave = 0

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'vim-scripts/bats.vim'

Plug 'rhysd/vim-clang-format'

Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'


" Colors {{{2
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'parsonsmatt/intero-neovim', {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
" }}}

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

let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_contrast_dark = 'hard'

set background=light
colorscheme PaperColor
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

let g:neoterm_autoscroll = 1
nnoremap <leader>rf :treplsendfile<cr>
vnoremap <leader>re :treplsendselection<cr>
nnoremap <leader>re :treplsendline<cr>

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

" formatting {{{
augroup fmt
  autocmd!
  " autocmd BufWritePre * undojoin | Neoformat
augroup END
" }}}

" Clojure Autocompletion {{{
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'

" More Clojure
let g:clojure_fold = 1

augroup clojure_mapping
    autocmd!
    au filetype clojure setlocal foldlevel=20
augroup end
" }}}
