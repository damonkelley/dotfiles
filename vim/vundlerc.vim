set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'benmills/vimux'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nicwest/QQ.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'mileszs/ack.vim'

" Language Plugins
Plugin 'fatih/vim-go'
Plugin 'wting/rust.vim'

" Syntax
Plugin 'python.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'evidens/vim-twig' 
Plugin 'StanAngeloff/php.vim'
Plugin 'damonkelley/django.vim'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'

" Colors
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on     " required
