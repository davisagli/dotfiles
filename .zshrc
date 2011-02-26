# enable autocompletion
autoload -U compinit
compinit

# configure prompt
autoload -U promptinit
promptinit
prompt walters

# use ctrl+left/right arrows to jump between words
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word

# use up/down arrows to autocomplete command from history
bindkey "\e[B" history-search-forward
bindkey "\e[A" history-search-backward

# Fix colors
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# add to PATH
export PATH=/opt/local/bin:${PATH}

# use joe as editor
export EDITOR=joe
