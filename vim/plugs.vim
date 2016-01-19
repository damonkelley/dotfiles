call plug#begin()

" Plug 'L9'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Display
Plug 'itchyny/lightline.vim'
" Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'

" Tools
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nicwest/QQ.vim'

" Navigations/Project
Plug 'shougo/unite.vim'
Plug 'shougo/vimproc.vim'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'

" Search
Plug 'mileszs/ack.vim'
Plug 'reinh/vim-makegreen'
Plug 'lambdalisue/nose.vim'

" Go
Plug 'fatih/vim-go', { 'for': 'go' }

" Lisps
Plug 'luochen1990/rainbow'

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
Plug 'avdgaag/vim-phoenix'
Plug 'tpope/vim-endwise'

" Ansible
Plug 'chase/vim-ansible-yaml'

" PHP
Plug 'evidens/vim-twig' 
Plug 'StanAngeloff/php.vim', { 'for': 'php' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

Plug 'tpope/vim-projectionist'

" Colors
Plug 'morhetz/gruvbox'
Plug 'jdkanani/vim-material-theme'
Plug 'nanotech/jellybeans.vim'

Plug 'mustache/vim-mustache-handlebars'
Plug 'lambdatoast/elm.vim'
Plug 'slim-template/vim-slim'

" Neovim
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()
