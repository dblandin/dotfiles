alias pear="php /usr/lib/php/pear/pearcmd.php" 
alias pecl="php /usr/lib/php/pear/peclcmd.php" 

export PATH=$HOME/bin:/usr/local/bin:/local/node/bin:$PATH
export EDITOR=vim
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

#for TMUX in iTerm2 to support VIM colorschemes
[[ $TERM == "screen" ]] && export -p TERM="screen-256color"

# homebrew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# load all bash plugins in .plugins dir
source $HOME/.plugins/*.sh

# git and git flow bash completion
[[ -s $HOME/.tmuxinator/scripts/tmuxinator_completion ]] && source $HOME/.tmuxinator/scripts/tmuxinator_completion

# show branch in status line
PS1='[\W$(__git_ps1 " (%s)")]\$ '

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
