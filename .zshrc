# aliases can be defined in a .aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# any exports should be defined in a .exports file that is not version controlled
if [ -f ~/.exports ]; then
    . ~/.exports
fi

