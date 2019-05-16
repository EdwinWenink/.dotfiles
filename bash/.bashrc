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

# Nicer command outputs
alias ls='ls --color=auto'
alias els='els --els-icons=fontawesome' # did not get this to work yet with urxvt
alias grep='grep --color=auto'

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
