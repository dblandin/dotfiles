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

fpath=(~/.zsh/completions $fpath)
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

setopt INC_APPEND_HISTORY
setopt histignorespace

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -f ~/.zshrc_functions ]; then
  source ~/.zshrc_functions
fi

if [ -f ~/.zshrc_aliases ]; then
  source ~/.zshrc_aliases
fi

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export GREP_COLORS='ms=01;31'
eval "$(hub alias -s)"

. /opt/asdf-vm/asdf.sh
. /opt/asdf-vm/completions/asdf.bash
