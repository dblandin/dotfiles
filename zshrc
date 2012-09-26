# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="agnoster"

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
plugins=(git bundler brew gem cloudapp git-flow github rails3 rvm autojump)

source $ZSH/oh-my-zsh.sh
source $HOME/.plugins/*.zsh

# Customize to your needs...

# PHP modules
alias pear="php /usr/lib/php/pear/pearcmd.php" 
alias pecl="php /usr/lib/php/pear/peclcmd.php" 

# tmuxinator and teamocil
export EDITOR=vim
export SHELL=/bin/zsh
compctl -g '$HOME/.teamocil/*(:t:r)' teamocil
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator_completion

# PATH config
export PATH=$HOME/bin:/usr/local/bin:/local/node/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/sbin:/usr/local/share/python:~/bin

# pretty RI output
export RI="--format ansi --width 70"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session as a function

if [[ "$TERM" != "screen-256color" ]] then
  tmux attach-session -t `whoami` || tmux new -s `whoami`
fi
