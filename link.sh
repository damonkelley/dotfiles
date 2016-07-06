# Script to symlink dotfiles

mkdir -p ~/.config
ln -s ~/dotfiles/vim ~/.config/nvim 
ln -s ~/dotfiles/idea/ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/fish ~/.config/fish
