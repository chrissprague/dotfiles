#!/bin/bash

# @file .bashrc
# @author Chris Sprague
# @brief bash config

###########
# Aliases #
###########

# This makes vim behave better when called as vi
alias vi=vim

# ls aliases
ls --color=auto > /dev/null 2>&1
if [[ "$?" -eq "0" ]];
then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# git
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glol='git log --oneline'
alias gc='git checkout'

# colorize grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

##########
# Prompt #
##########

# root = foo, otherwise = bar
if [ "$EUID" -eq 0 ]
then
    PSCOLORCODE=31
else
    PSCOLORCODE=36
fi

#PS1='\[\033[${PSCOLORCODE}m\]\u@\h\[\033[00m\]:\[\033[01;39m\]\w\[\033[00m\]\$ '
PS1="\[\e[0;38;5;33m\]\u\[\e[0m\]@\[\e[0;38;5;14m\]\h\[\e[0m\]:\[\e[0;38;5;96m\]\w\[\e[0m\]\$ "

