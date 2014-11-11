ZSH=$HOME/.oh-my-zsh
# -------------------------------------
# oh-my-zsh configuration
# -------------------------------------

# theme (~/.oh-my-zsh/themes/)
export ZSH_THEME="nicoulaj"

# oh-my-zsh settings
DISABLE_AUTO_UPDATE='true'
DISABLE_AUTO_TITLE='true' # was also messing up tmux window titles

# oh-my-zsh plugins (~/.oh-my-zsh/plugins/)
plugins=(autojump)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# -------------------------------------
# Source additional zsh configuration files
# -------------------------------------

source $HOME/.zsh/aliases
source $HOME/.zsh/zsh_functions

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

# -------------------------------------
# environment variables
# -------------------------------------

export EDITOR=vim
export SHELL=/bin/zsh

# -------------------------------------
# rbenv config
# -------------------------------------

export RI="--format ansi --width 70"
export RBENV_ROOT=/usr/local/opt/rbenv

if which rbenv > /dev/null;then
  eval "$(rbenv init -)";
fi

# -------------------------------------
# ruby tuning
# -------------------------------------

# ruby tuning
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=40000

# -------------------------------------
# tmux
# -------------------------------------

if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t $(whoami) || tmux new -s $(whoami)
  fi
fi

source $HOME/.zshrc.local
