setopt inc_append_history
setopt share_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

setopt promptsubst

bindkey -e # Use emacs mode
autoload -U colors && colors

# Enable and configure edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# FZF-Tab Settings
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with exa when completing cd
# only aws command completion 
zstyle ':completion:*:*:aws' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true
