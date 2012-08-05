alias pear="php /usr/lib/php/pear/pearcmd.php" 
alias pecl="php /usr/lib/php/pear/peclcmd.php" 

export PATH=~/bin:/usr/local/bin:/local/node/bin:$PATH

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# git and git flow bash completion
source ~/.git-completion.sh
source ~/.git-flow-completion.sh

# show branch in status line
source ~/.git-prompt.sh
PS1='[\W$(__git_ps1 " (%s)")]\$ '

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
