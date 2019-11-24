#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default prompt
#PS1='[\u@\h \W]\$ '

## Custom Prompt 
# enter blinking mode - red
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
# enter double-bright mode - bold, magenta
export LESS_TERMCAP_md=$(printf '\e[01;35m')
# turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_me=$(printf '\e[0m')
# leave standout mode
export LESS_TERMCAP_se=$(printf '\e[0m')
# enter standout mode - green
export LESS_TERMCAP_so=$(printf '\e[01;32m')
# leave underline mode
export LESS_TERMCAP_ue=$(printf '\e[0m')
# enter underline mode - blue
export LESS_TERMCAP_us=$(printf '\e[04;34m')

# Add custom enviroment
PATH=$PATH:~/Scripts

# Setting variables
export PATH=$PATH:/opt/anaconda/bin
export PATH=$PATH:$HOME/.node_modules_global/bin
export PATH=$PATH:/home/edwin/Documents/AI/clean3/bin
export NOTES_DIR=/home/edwin/Documents/Notes
export WEBSITE=/home/edwin/Website/personal_website



# PS1 Setup
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXITCODE="$?"

    local HOSTCOLOR="5"
    local USERCOLOR="3"
    local PATHCOLOR="4"

    #PS1="\e[3${HOSTCOLOR}m \h  \e[3${USERCOLOR}m \u  \e[3${PATHCOLOR}m \w \n";

	_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! $_BRANCH == "" ]
	then
		_BRANCH_STR="[\[$(tput sgr0)\]\[\033[38;5;11m\]$_BRANCH\[$(tput sgr0)\]\[\033[38;5;7m\]]"
	else
		_BRANCH_STR=""
	fi

    PS1="\e[3${HOSTCOLOR}m[\h|\e[3${USERCOLOR}m\u] \e[3${PATHCOLOR}m\W $_BRANCH_STR ";

    if [ $EXITCODE == 0 ]; then
        PS1+="\e[32m> \e[0m";
    else
        PS1+="\e[31m> \e[0m";
    fi
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Source alias not found hook
#source /usr/share/doc/pkgfile/command-not-found.bash

# Setting aliases

alias lsd=changeDirectory
alias bashedit='vim /etc/bash.bashrc'
alias ..='cd ..'
alias bye=customShutdown
alias ai='cd /home/edwin/Documents/AI/'
alias reopen=reopen.sh
alias oad='openAndDisown'
alias steamFolder='cd /home/edwin/.local/share/Steam/steamapps/common'
alias agenda='gcalcli agenda'
alias readmail='neomutt'
alias play='playerctl play'
alias pause='playerctl pause'
alias stop='playerctl stop'
alias next='playerctl next'
alias previous='playerctl previous'
alias bar='bash ~/.config/polybar/launch.sh & disown'
alias mutt='neomutt'
alias web='ranger --cmd="cd $WEBSITE"'
alias task='bash /usr/local/bin/do.sh'
alias did='/bin/bash done.sh'
alias notes='vim ~/Documents/Notes/index.md'

# Nicer command outputs
alias ls='ls --color=auto'
alias els='els --els-icons=fontawesome' # did not get this to work yet with urxvt
alias grep='grep --color=auto'
alias tg='telegram-cli -N'


# Corresponding functions

command_not_found_handle() {
  echo 8===3 ~
  
  return 127
}

function customShutdown {
  clear
  /bin/bash randomcowsay.sh
  sleep 5s
  shutdown 0
}

function openAndDisown {
	$@ & disown
}

# automatically prepend cd command to directory names
# shopt -s autocd

# Welcome message
#cat /usr/bin/ascii/ju87.txt
echo Date: $(date +%F)
echo Time: $(date +%T)
echo $(acpi)

# Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls --group-directories-first
  else
    builtin cd ~ && ls --group-directories-first
  fi
}

BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# BEGIN LAMACHINE MANAGED BLOCK - path
if [[ "$PATH" != *"/home/edwin/bin"* ]]; then
    export PATH=~/bin:$PATH #add ~/bin to $PATH, that is where the activation scripts are
fi
# END LAMACHINE MANAGED BLOCK - path

export PATH=~/Jason/scripts/:$PATH
