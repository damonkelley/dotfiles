set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Included with Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'L9'

" My Plugins
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'benmills/vimux'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'shougo/unite.vim'
Plugin 'mileszs/ack.vim'

" Syntax
Plugin 'evidens/vim-twig' 
Plugin 'StanAngeloff/php.vim'
Plugin 'django.vim'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'

call vundle#end()
filetype plugin indent on     " required
