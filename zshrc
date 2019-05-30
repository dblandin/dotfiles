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
# source /usr/share/chruby/chruby.sh
# source /usr/share/chruby/auto.sh

alias clip="xclip -o | xclip -sel clip"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# source /usr/share/zsh/share/antigen.zsh

# antigen bundle chrissicool/zsh-256color
# #antigen bundle aws-vault
# antigen bundle git
# antigen bundle command-not-found
# antigen bundle zsh-users/zsh-syntax-highlighting
# #antigen theme candy

# antigen apply

if [[ $TTY == /dev/tty1 ]] && [[ -z $DISPLAY ]]; then
  exec startx
fi

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
source /usr/share/nvm/init-nvm.sh
