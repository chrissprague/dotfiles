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
alias gbv='git branch -v'
alias gf='git fetch --all -p'
alias gl='git log --oneline'
alias gr='git remote -v'

# colorize grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

##########
# Prompt #
##########


COLOR_SUFFIX="0;49;"
RED="31m"
GREEN="32m"
YELLOW="33m"
BLUE="34m"
CYAN="36m"
WHITE="37m"
GRAY="90m"

BOLD="1;"

PS1_USER_COLOR=$COLOR_SUFFIX$YELLOW
PS1_HOST_COLOR=$COLOR_SUFFIX$GREEN
PS1_DIR_COLOR=$COLOR_SUFFIX$BOLD$WHITE


# Check if the user is root
if [ "$(id -u)" -eq 0 ]; then
    # root (mono-color version)
    PS1="\[\033[${COLOR_SUFFIX}${RED}\]\u@\h\[\033[00m\]:\[\033[01;39m\]\w\[\033[00m\]\$ "
else
    # non-root
    PS1="\[\e[$PS1_USER_COLOR\]\u\[\e[0m\]@\[\e[$PS1_HOST_COLOR\]\h\[\e[0m\]:\[\e[$PS1_DIR_COLOR\]\w\[\e[0m\]\$ "
fi
