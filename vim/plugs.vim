call plug#begin()

Plug 'gmarik/Vundle.vim'
Plug 'L9'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'benmills/vimux'
" Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nicwest/QQ.vim'
Plug 'shougo/unite.vim'
Plug 'shougo/vimproc.vim'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'

" Language Plugins
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'klen/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'luochen1990/rainbow'

" Syntax
Plug 'chase/vim-ansible-yaml'
Plug 'evidens/vim-twig' 
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'damonkelley/django.vim'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Glench/vim-jinja2-syntax'

" Colors
Plug 'morhetz/gruvbox'

call plug#end()
