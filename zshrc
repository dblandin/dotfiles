# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="nicoulaj"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true" # was also messing up tmux window titles

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh
source $HOME/.plugins/*.zsh

# Customize to your needs...

# vim key bindings
set -o vi

tilde_or_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/"
}

. $HOME/code/dotfiles/zsh/aliases

# PHP modules
alias pear="php /usr/lib/php/pear/pearcmd.php"
alias pecl="php /usr/lib/php/pear/peclcmd.php"

alias rspec="bundle exec rspec"
alias ll='ls -lh'
alias lll='ls -lah'

# tmuxinator and teamocil
export EDITOR=vim
export SHELL=/bin/zsh
export PLATFORM="mac"
export USE_PATCHED_FONT="true"
export DEBUG_MODE="false"

compctl -g '$HOME/.teamocil/*(:t:r)' teamocil
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator_completion

# PATH config
export PATH=$HOME/bin:/usr/local/share/npm/bin:/usr/local/opt/rbenv/shims:/usr/local/bin:/local/node/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/sbin:/usr/local/share/python:~/bin:/usr/local/texlive/2012/bin/universal-darwin:$PATH

# pretty RI output
export RI="--format ansi --width 70"

# CD config
export CDPATH=:..:~:~/code

# pretty RI output
export RI="--format ansi --width 70"

psman() { man -t "${1}" | open -f -a /Applications/Preview.app/ }
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# rvenv
export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RBENV_VERSION=1.9.3-p327-perf

# pg gem
export ARCHFLAGS="-arch x86_64"

# ruby tuning
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

