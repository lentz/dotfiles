HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
bindkey "^R" history-incremental-search-backward

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit

# load color names for use in prompt
autoload -U colors && colors

export EDITOR=vim

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

