# don't put duplicate lines or lines start with space in the history.
# see bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE & HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# aliases can be defined in a .aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# any exports should be defined in a .exports file that is not version controlled
if [ -f ~/.exports ]; then
    . ~/.exports
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
