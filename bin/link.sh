# Script to symlink dotfiles

mkdir -p ~/.config
ln -svfn ~/dotfiles/nvim ~/.config/nvim
ln -svfn ~/dotfiles/bin ~/.bin
ln -svfn ~/dotfiles/alacritty ~/.config/alacritty
ln -svf ~/dotfiles/starship/starship.toml ~/.config
ln -svf ~/dotfiles/idea/ideavimrc ~/.ideavimrc
ln -svf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -svf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -svf ~/dotfiles/zsh/zshrc ~/.zshrc
