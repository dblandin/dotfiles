# -------------------------------------
# setup key bindings
# -------------------------------------

# vim key bindings
set -o vi

# history search bindings
bindkey '^r'   history-incremental-pattern-search-backward
bindkey '^p'   history-beginning-search-backward
bindkey '^n'   history-beginning-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# -------------------------------------
# additional zsh setup
# -------------------------------------

unsetopt correct_all

# compsys initialization

autoload -U compinit
compinit

# -------------------------------------
# environment variables
# -------------------------------------

export PATH=~/bin:$PATH
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000
export SAVEHIST=100000

setopt INC_APPEND_HISTORY
setopt histignorespace

export BROWSER=$(which nvim)
export EDITOR=$(which nvim)
export SHELL=$(which zsh)
export VISUAL=$(which nvim)

export PS1='$ '
source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh

if [[ $TTY == /dev/tty1 ]] && [[ -z $DISPLAY ]]; then
  exec startx
fi

alias vim=$(which nvim)
alias clip="xclip -o | xclip -sel clip"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
