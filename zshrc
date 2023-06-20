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

# Prompt with git info
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUPSTREAM="verbose"
precmd () { __git_ps1 "[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m %{$fg_no_bold[blue]%}%~%{$reset_color%}" "]$ " " (%s)" }

export EDITOR=vim

# Default Less options
export LESS="-r -S"

export PATH=./node_modules/.bin:$PATH

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Aliases
[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

# Must occur after local config for aliases
eval `dircolors ~/.dir_colors`

# FZF autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# flyctl completion
[ -f ~/.flyctl-completion.zsh ] && source ~/.flyctl-completion.zsh

# Load Angular CLI autocompletion.
source <(ng completion script)
