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

export PATH=~/bin:~/.local/bin:~/.npm-global/bin:$PATH
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000
export SAVEHIST=100000
# export NPM_CONFIG_PREFIX=~/.npm-global


setopt INC_APPEND_HISTORY
setopt histignorespace

export PS1='$ '

alias clip="xclip -o | xclip -sel clip"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -f ~/.zshrc_aliases ]; then
  source ~/.zshrc_aliases
fi

if [[ $TTY == /dev/tty1 ]] && [[ -z $DISPLAY ]]; then
  exec startx
fi
