if [[ "$OSTYPE" == "darwin"* ]]; then
    export TERM=xterm-256color
else
    export TERM=rxvt-unicode-256color
fi

export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/code/
export VIRTUAL_ENV_DISABLE_PROMPT=0
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export ESHELL=/bin/zsh
export PATH=/usr/local/bin:$PATH
export EDITOR=nvim
