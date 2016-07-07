" vim:fdm=marker

" Plugins {{{
call plug#begin()

Plug 'takac/vim-hardtime'

" Git {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tpope {{{2
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'

" Neovim {{{2
if has('nvim')
  Plug 'kassio/neoterm'
  Plug 'damonkelley/neomake'

  " Completion
  Plug 'Shougo/deoplete.nvim'
endif
"}}}

" Parenthesis {{{2
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

" Tools {{{2
Plug 'janko-m/vim-test'

" Navigations/Project {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'


" Registers/Undo {{{2
Plug 'junegunn/vim-peekaboo'

" Writing {{{2
Plug 'junegunn/goyo.vim'

" Language {{{2

Plug 'vim-ruby/vim-ruby'
Plug 'damonkelley/python-syntax', {'for': 'python'}

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-endwise'

Plug 'slim-template/vim-slim'

Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
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
set belloff=all

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
set relativenumber

set cursorline

set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•
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
  let g:python_host_prog='/usr/bin/python'
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
augroup END
"}}}

" Colors {{{
color hybrid
set background=dark

let g:terminal_color_0  = '#2D3C46'
let g:terminal_color_1  = "#A54242"
let g:terminal_color_2  = "#8C9440"
let g:terminal_color_3  = "#DE935F"
let g:terminal_color_4  = "#5F819D"
let g:terminal_color_5  = "#85678F"
let g:terminal_color_6  = "#5E8D87"
let g:terminal_color_7  = "#6C7A80"
let g:terminal_color_8  = "#425059"
let g:terminal_color_9  = "#CC6666"
let g:terminal_color_10 = "#B5BD68"
let g:terminal_color_11 = "#F0C674"
let g:terminal_color_12 = "#81A2BE"
let g:terminal_color_13 = "#B294BB"
let g:terminal_color_14 = "#8ABEB7"
let g:terminal_color_15 = "#C4C8C6"
" }}}
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
nnoremap <leader>et :vsplit ~/.tmux.conf<CR>
cnoremap <C-A> <HOME>
nnoremap <leader>w :w<CR>

nnoremap \ :noh<CR>

nnoremap <Leader>rt :call ReTag()<CR>

" Always use very magic searches
nnoremap / /\v
vnoremap / /\v

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

" Open FZF in a new tab.
let g:fzf_layout = { 'window': 'execute (tabpagenr()-1)."tabnew"' }
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
" }}}

" vim-test {{{
function! NeomakeTest(cmd)
  call neomake#Sh(a:cmd, function('s:neomakeTestCallback'))
endfunction

function! s:neomakeTestCallback(result)
  if a:result.status != '0'
    echohl TestFail | echom "Failed: " . a:result.name
  else
    echohl TestPass | echom "Failed: " . a:result.name
  endif
  echohl None
endfunction

highlight TestFail guibg=red guifg=white
highlight TestPass guibg=green guifg=white

let g:test#custom_strategies = {'neomake': function('NeomakeTest')}
" }}}

" Hardtimes {{{

augroup hardtime_settings
  autocmd!
  autocmd FileType netrw call HardTimeOn()
augroup END

let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" }}}


" Markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}
