### @amdavidson's bashrc

# define useful aliases for color codes
sh_norm="\[\033[0m\]"
sh_black="\[\033[0;30m\]"
sh_dark_gray="\[\033[1;30m\]"
sh_blue="\[\033[0;34m\]"
sh_light_blue="\[\033[1;34m\]"
sh_green="\[\033[0;32m\]"
sh_light_green="\[\033[1;32m\]"
sh_cyan="\[\033[0;36m\]"
sh_light_cyan="\[\033[1;36m\]"
sh_red="\[\033[0;31m\]"
sh_light_red="\[\033[1;31m\]"
sh_purple="\[\033[0;35m\]"
sh_light_purple="\[\033[1;35m\]"
sh_brown="\[\033[0;33m\]"
sh_yellow="\[\033[1;33m\]"
sh_light_gray="\[\033[0;37m\]"
sh_white="\[\033[1;37m\]"

# Set some defaults.
export GOPATH="$HOME/go"
export EDITOR="vim"
export PATH=".:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:~/bin"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export DOTFILES_DIR=$HOME'/.dotfiles'

# Make a pretty prompt.
export PROMPT_COMMAND='history -a; if [ $? -ne 0 ];then ERROR_FLAG=1;else ERROR_FLAG=;fi;$DOTFILES_DIR/check_update.sh'
export PS1=${HOSTCOLOUR}${sh_light_gray}'\t | \h'${sh_green}':\w'${sh_light_gray}' '${sh_light_gray}'${ERROR_FLAG:+'${sh_light_red}'}\$ '${sh_norm}

# New files and folders should not be world readable
umask 0027

# Borrow features from sensible.bash

# Trim long paths in prompt
PROMPT_DIRTRIM=2

# Update window size after every command
shopt -s checkwinsize

# Append history don't overwrite
shopt -s histappend

# Save multi-line commands as one line
shopt -s cmdhist

# Avoid duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Use ISO8601 time format for history file.
export HISTTIMEFORMAT='%F %T '

# Big history file
HISTSIZE=500000
HISTFILESIZE=100000


# Aliases!

# jump down the tree.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# empty the screen (or use C-l)
alias c="clear"

# why wouldn't you want human readable sizes?
alias df="df -h"

# get outta here!
alias e="exit"

# grep shortie
alias g="grep --color=auto -i "

# get shortcuts.
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gs="git status"

# shorter ls
alias l="ls -G"

# list files with details
alias ll="ls -lh"

# list all files.
alias la="ls -alh"

# List directories.
alias ld="ls -Gd */"

# Find out what connections are happening.
alias lsconn="sudo lsof -i -P"

# add some color to grep.
alias grep="grep --color=auto"

# make the whole directory tree if required and let us know about it.
alias mkdir="mkdir -p -v "

# don't ping forever.
#alias ping="ping -c5"

# refresh the shell customizations without opening a new one.
alias refresh="source ~/.bashrc"

# A python calculator
alias pc='python -ic "from __future__ import division; from math import *"'

# Start nano with line numbering no wrapping and autoindenting
alias nano='nano -ciw '

if [[ $(uname) = 'Darwin' ]]; then
    # Open man file in Preview.app.
    pman () {
        man -t "${1}" | open -f -a /Applications/Preview.app
    }
fi

# General purpose extract command.
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	    tar xjf $1		;;
			*.tar.gz)		tar xzf $1		;;
			*.tar.xz)       tar xJf $1      ;;
			*.bz2)			bunzip2 $1		;;
			*.rar)			rar x $1		;;
			*.gz)			gunzip $1		;;
			*.tar)			tar xf $1		;;
			*.tbz2)			tar xjf $1		;;
			*.tgz)			tar xzf $1		;;
			*.zip)			unzip $1		;;
			*.Z)			uncompress $1	;;
			*.7z)			7za e $1        ;;
			*.xz)           xz -dv $1       ;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


# General purpose backup command.
bu () { tar czf  ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.tgz $1; }

# History Search
h () { grep "$1" ~/.history/*; }


# Search for a process:
p () {
	if [ ! -z $1 ] ; then
		ps aux | grep $1 | grep -v grep
	else
		echo "must provide search string"
	fi
}


# Find a file in the current tree.
f () {
	if [ ! -z $1 ] ; then
		find . | grep $1
		#find . -name $1 -print;
	fi
}



# Repeat function, do something until you ^C out of it.
# Syntax: r sleep_time_in_seconds command_to_run
r () {
    if [ ! -z $1 ]
    then
        if [ ! -z $2 ]
        then
            while [ yes ]
            do
                $2
                echo ""
                sleep $1
            done
        else
            echo "Must have a command for second argument"
        fi
    else
        echo "Simple function to loop a command."
        echo "Example, to print the date every 5 seconds:"
        echo "$ r 5 date"
    fi
}

# Function to count IP address found in file(s)
count-IPs () {
    grep -E -o -h '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' |\
    sed -E 's/([0-9]*\.[0-9]*)\.[0-9]*\.[0-9]*/\1/' | \
    uniq -c | \
    sort -r
}

# Import local extensions if needed.
if [ -f $HOME/.bashrc_local ]; then
	source $HOME/.bashrc_local
fi

