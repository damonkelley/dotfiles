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
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'StanAngeloff/php.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'evidens/vim-twig' 
Plugin 'Shougo/unite.vim'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
" Plugin 'edkolev/tmuxline.vim'

call vundle#end()
filetype plugin indent on     " required
