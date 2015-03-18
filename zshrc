HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt autocd extendedglob nomatch notify
# Fix issue using carrot in git refs
setopt NO_NOMATCH

unsetopt beep
bindkey -e
bindkey "^R" history-incremental-search-backward

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit

# Load color names and allow expansion for prompt
setopt prompt_subst
autoload -U colors && colors

export EDITOR=vim

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Must occur after local config for aliases
eval `dircolors ~/.dir_colors`

