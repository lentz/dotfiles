if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

export TZ="America/New_York"
export EDITOR=nvim
export GREP_OPTIONS="--color --extended-regexp --line-buffered"
export HISTSIZE=10000
export HISTFILESIZE=10000
export LESS="-R -S"
export PATH=$HOME/.local/bin:$HOME/.local/src/node/bin:./node_modules/.bin:$PATH

# Disable shell timeout
unset TMOUT

if [[ -n "$PS1" ]]; then
  # Git completion and prompt
  if [[ -f ~/.git-completion.bash ]]; then
    source ~/.git-completion.bash
    __git_complete g git # Support completion for 'g' alias
  fi
  [[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWUPSTREAM="verbose"

  YELLOW="\[$(tput setaf 3)\]"
  BLUE="\[$(tput setaf 4)\]"
  ORANGE="\[$(tput setaf 1)\]"
  RESET="\[$(tput sgr0)\]"

  PROMPT_COMMAND='__git_ps1 "[${ORANGE}devbox ${BLUE}\w${RESET}" "]\\\$ "'

  # FZF autocompletion
  [[ -x "$(command -v rg)" ]] && export FZF_DEFAULT_COMMAND='rg --files --follow'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

  # Aliases
  [[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

  # Must occur after local config for aliases
  eval `dircolors ~/.dir_colors`

  # Angular CLI autocompletion
  if [[ -x "$(command -v ng)" ]]; then
    [[ ! -f ~/.ng-completion.sh ]] && ng completion script > ~/.ng-completion.sh
    source ~/.ng-completion.sh
  fi
fi

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
