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

" Parenthesis {{{2
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

" Tools {{{2
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Navigations/Project {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
Plug 'benekastah/neomake'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'

" Completion {{{2
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'

" Registers/Undo {{{2
Plug 'junegunn/vim-peekaboo'

" Writing {{{2
Plug 'junegunn/goyo.vim'

" Language {{{2
" Go
Plug 'fatih/vim-go', { 'for': 'go' }

" Python
Plug 'damonkelley/python-syntax', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'python-rope/ropevim', {'for': 'python'}
Plug '5long/pytest-vim-compiler', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'damonkelley/django.vim'
Plug 'Glench/vim-jinja2-syntax'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', {'do': './install.sh'}
Plug 'tpope/vim-endwise'

" Ansible
Plug 'chase/vim-ansible-yaml'

" PHP
Plug 'evidens/vim-twig' 
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'lambdatoast/elm.vim'
Plug 'slim-template/vim-slim'

" Colors {{{2
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
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

" Tabs 
set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

" Searching
set nohlsearch
set ignorecase
set smartcase

" Line Numbers
set number
set relativenumber

set cursorline

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•
"}}}

" Neovim {{{
if has('nvim')
  let g:python3_host_prog='/usr/local/bin/python3'
  let g:python_host_prog='/usr/bin/python'
endif
"}}}

" File Type Settings {{{
augroup FileTypeSettings
  au FileType javascript setlocal ts=2 softtabstop=2 sw=2
  au FileType htmldjango setlocal ts=4 softtabstop=4 sw=4
  au FileType vim setlocal ts=2 softtabstop=2 sw=2
augroup END
"}}}

" Colors {{{
color hybrid

let s:uname = system("uname -s")
if s:uname == "Darwin\n"
  let g:gruvbox_italic=0 " OSX setting
endif

let g:gruvbox_contrast_dark = 'hard'
set background=dark

" Terminal colors {{{
let g:terminal_background = "#1d2021"
let g:terminal_foreground = "#f9f5d7"
let g:terminal_color_0    = "#7c6f64"
let g:terminal_color_1    = "#fb4934"
let g:terminal_color_2    = "#fe8019"
let g:terminal_color_3    = "#7c6f64"
let g:terminal_color_4    = "#83a598"
let g:terminal_color_5    = "#8ec07c"
let g:terminal_color_6    = "#8ec07c"
let g:terminal_color_7    = "#7c6f64"
let g:terminal_color_8    = "#ebdbb2"
let g:terminal_color_9    = "#d3869b"
let g:terminal_color_10   = "#b8bb26"
let g:terminal_color_11   = "#b8bb26"
let g:terminal_color_12   = "#fb4934"
let g:terminal_color_13   = "#fabd2f"
let g:terminal_color_14   = "#b8bb26"
let g:terminal_color_15   = "#b8bb26"
" }}}
" }}}

" Display {{{
if &term =~ '^rxvt-unicode'
  hi Comment cterm=italic
endif

set t_ut=      " Use the current background color | Resolves issues with tmux
" }}}

" Completion {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Mappings {{{
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Generic Bindings
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>

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

" Vimux
noremap <Leader>vp :VimuxPromptCommand<CR>
noremap <Leader>vl :VimuxRunLastCommand<CR>
noremap <Leader>vq :VimuxCloseRunner<CR>
noremap <Leader>vi :VimuxInspectRunner<CR>
noremap <Leader>vz :VimuxZoomRunner<CR>
noremap <Leader>vs :VimuxInterruptRunner<CR>
noremap <Leader>vc :VimuxClearRunnerHistory<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

vnoremap <leader>vs "vy :call VimuxSlime()<CR>
nnoremap <leader>vs vip<leader>vs<CR>

" FZF
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <leader>fr :ProjectFiles<CR>
nnoremap <leader>b :Buffers<CR>
"}}}

" Other Files {{{
source ~/.config/nvim/statusline.vim
"}}}

let test#strategy = 'neotermlite'
