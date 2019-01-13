# Script to symlink dotfiles

mkdir -p ~/.config
ln -svfn ~/dotfiles/vim ~/.config/nvim
ln -svf ~/dotfiles/idea/ideavimrc ~/.ideavimrc
ln -svf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -svf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -svf ~/dotfiles/zsh/zshrc ~/.zshrc
