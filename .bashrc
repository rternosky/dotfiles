# Include git completion bashrc fragments. Download from:
# https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
# mg git-completion.bash .git-completion
source ~/.git-completion

# Setup file creation permissions default as 644
umask=006

##################################################
# General Unix-y environment setup
export EDITOR=vi
export MANPATH=/usr/man:/usr/local/ma
export MPAGE='-b letter'
export MANPATH=/usr/share/man
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
##################################################

################################################ 
# Define what your prompt looks like
# Standard Prompt
#export PS1="[\u@\h \W]\\$ "
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# For a colorized prompt do this:
color_prompt=yes

# For no color prompt use this instead
#color_prompt=

# Pick prompt based on color support..but also add git branch info
# \u = user
# \h = host
# \W = relative path (\w  = absolute path)
# [01;32m] sets green on \u\h
# [01;34m] sets blue on \W
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}[\u@\h:\W$(__git_ps1 " (%s)")]\$ '
fi

# Prompt with git branch added - no colors
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
################################################ 

################################################
# Launch SSH Keychain
################################################
/usr/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh

################################################
# Command shortcuts - optional
alias which="type -path"
alias h='history'
alias l='ls -lh'
alias ls='ls --color'
alias tree='tree -C'

# Add some color to grep commands. Speed it up by skipping dir names
# handle common typos
alias egrep='egrep --color=tty -d skip'
alias egrpe='egrep --color=tty -d skip'
alias fgrep='fgrep --color=tty -d skip'
alias fgrpe='fgrep --color=tty -d skip'

# Frequent Typos
alias grep='grep --color=tty -d skip'
alias grpe='grep --color=tty -d skip'
################################################

#################################################
# Path control
export PATH=/bin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:/sbin:/usr/sbin
#################################################

#################################################
# Mess with tab completion
# Tab completion to only show directories when using cd
complete -d cd

# Don't show files ending in ~ using tab completion (.o:~ would do .o's too).
export FIGNORE=\~
#################################################

####################################################
# Control "history" command behavior
# If I run same command back to back don't put in history
export HISTCONTROL=ignoredups:ignorespace

# Append not overwrite
shopt -s histappend

# in memory readline history size (default is 500)
export HISTSIZE=5000

# disk backed readline history size (default is 500)
export HISTFILESIZE=5000

# Add timestamp to each line
HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
####################################################

####################################################
# Utility functions

# Purpose: Convert a Unix time_t to a human readable date
#        e.g.: x 1234567890.0 returns: 2009-02-13 18:31:30
# Usage  : x TIME_T value
function x () {
   date -d"1970-01-01 UTC $1 seconds" +"%Y-%m-%d %H:%M:%S";
}

# Purpose: Show all process running as you
# Usage  : z
function z () {
   pstree -ap $USER
}

# Purpose: Function to do a ps with a search
# Usage  : pss SOMESTRING
function pss () {
    ps -aefl | grep "$1"
}

# Purpose: Function to do a filename search
# Usage  : ff FILENAMEPATTERN
function ff () {
    find . -name "$1" -print
}

# Purpose: Function to find files and perform a search
# Usage  : ffs FILENAMEPATTERN SOMESTRING
function ffs () {
    ff "$1" | xargs grep "$2"
}

# Purpose: Function to find files and perform a search case insensitively
# Usage  : ffs FILENAMEPATTERN SOMESTRING
function ffsi () {
    ff "$1" | xargs grep -i "$2"
}

# Purpose: Function to find .py files in the current directory and search for a string in them
# Usage  : fpy SOMESTRING
function fpy () {
    ffsi '*.py' "$1"
}

# Purpose: Function to find .sql files in the current directory and search for a string in them
# Usage  : fsql SOMESTRING
function fsql () {
    ffsi '*.sql' "$1"
}

# Purpose: Function to find .xml files in the current directory and search for a string in them
# Usage  : fxml SOMESTRING
function fxml () {
    ffsi '*.xml' "$1"
}

# Purpose: Function to find .js files in the current directory and search for a string in them
# Usage  : fjs SOMESTRING
function fjs () {
    ffsi '*.js' "$1"
}

# Purpose: Function to find .css files in the current directory and search for a string in them
# Usage  : fcss SOMESTRING
function fcss () {
    ffsi '*.css' "$1"
}

# Purpose: Function to find all .pyc files and remove them
# Usage  : rmpyc
function rmpyc () {
    ffsi '*.pyc' | xargs rm
}

####################################################
