autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U compinit && compinit
autoload -Uz vcs_info
autoload zmv
zmodload -i zsh/complist

setopt autocd
setopt promptsubst
setopt append_history histignorealldups
