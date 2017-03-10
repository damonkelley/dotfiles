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

Plug 'tpope/vim-projectionist'

" Neovim {{{2
if has('nvim')
  Plug 'neomake/neomake'

  " Completion
  Plug 'Shougo/deoplete.nvim'
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
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'powerman/vim-plugin-AnsiEsc', {'for': 'elixir'}
Plug 'tpope/vim-endwise', {'for': 'elixir'}
"
"Clojure
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'

Plug 'vim-scripts/bats.vim'

Plug 'rhysd/vim-clang-format'

" Colors {{{2
Plug 'w0ng/vim-hybrid'
Plug 'flazz/vim-colorschemes'
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

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

" Searching
set hlsearch
set ignorecase
set smartcase

" Line Numbers
set number
if exists('&relativenumber')
  set relativenumber
endif

set cursorline

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•
set exrc

if exists('&inccommand')
  set inccommand=split
endif
"}}}

" Tags {{{
set tags+=.git/tags

function! ReTag()
    let l:cmd = "ctags --tag-relative -Rf.git/tags"

    if exists(':NeomakeSh')
        execute ":NeomakeSh ".l:cmd
    else
        execute ":!".l:cmd."\<CR>"
    endif
endfunction
" }}}

" Neovim {{{
if has('nvim')
  let g:python3_host_prog='/usr/local/bin/python3'
  let g:python_host_prog='/usr/local/bin/python'
endif
"}}}

" File Type Settings {{{
augroup FileTypeSettings
  autocmd!
  au FileType javascript setlocal ts=2 softtabstop=2 sw=2
  au FileType htmldjango setlocal ts=4 softtabstop=4 sw=4
  au FileType vim setlocal ts=2 softtabstop=2 sw=2
  au FileType elixir setlocal foldmethod=syntax foldlevel=20
  au FileType ruby setlocal ts=2 sw=2 softtabstop=2
  au FileType markdown setlocal spell
  au FileType clojure setlocal lispwords+=describe,context,it,around
  au FileType clojure setlocal lispwords+=describe,context,it,around
  au CmdwinEnter * setlocal cc=0 nonumber norelativenumber
augroup END
"}}}

" Colors {{{
if exists('&termguicolors')
  set termguicolors
endif

color hybrid
set background=dark
" }}}
" }}}

" Completion {{{
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
nnoremap <silent> <leader>* :Ag <C-R><C-W><CR>
nnoremap <leader>/ :Ag 

" Always use very magic searches
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>\ :noh<CR>

nnoremap * *``


" Neovim Terminal
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
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
nnoremap <leader>fr :ProjectFiles<CR>
nnoremap <leader>b :Buffers<CR>

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
" Markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

" Clojure autocompletion {{{
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'

" Clojure
let g:clojure_fold = 1

function! CljLint()
  execute ":Require eastwood.lint | Eval (eastwood.lint/eastwood {:namespaces ['" . fireplace#ns(). "] :linters [:all]})"
endfunction

function! CljTestFile()
  echomsg expand("%")
  exec ":Require speclj.cli | Eval (speclj.cli/run \"". expand("%") ."\" )"
endfunction

augroup clojure_mapping
    autocmd!
    au FileType clojure nnoremap <F6> :call CljLint()<CR>
    au FileType clojure nnoremap <leader>tf :call CljTestFile()<CR>
    au FileType clojure setlocal foldlevel=20
augroup END
" }}}
