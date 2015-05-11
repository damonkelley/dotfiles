# virtualenvWrapper 
source /usr/local/bin/virtualenvwrapper.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    source $HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
else
    source $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi
