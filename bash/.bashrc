#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set default terminal for i3
# https://jlk.fjfi.cvut.cz/arch/manpages/man/i3-sensible-terminal.1
export TERMINAL=xterm

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
export PATH=$PATH:$HOME/.node_modules_global/bin
export PATH=$PATH:/home/edwin/Documents/AI/clean3/bin
export NOTES=/home/edwin/Documents/Notes
export WEBSITE=/home/edwin/Website/personal_website

# PS1 Setup
PROMPT_COMMAND=__prompt_command

# This is how you do comments
: <<'END'
END

__prompt_command() {
    local EXITCODE="$?"
    RCol='\033[0m'
    Gre='\033[32m';
    Red='\033[31m';
    Blu='\033[34m';
    Yel='\033[33m';
    Lambda=$'\U03bb';
    PS1="${RCol}┌─[\`if [ \$? = 0 ]; then echo "${Gre}"; else echo "${Red}"; fi\`\t\[${Rcol}\] \[${Blu}\]\h\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ ${Lambda} "
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Choose Base16 theme
#base16_pop
#base16_default-light
#base16_papercolor-dark
base16_google-light
#random-color-scheme.sh


# Setting aliases

alias lsd=changeDirectory
alias bashedit='vim /etc/bash.bashrc'
#alias ..='cd ..'
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
alias emacs='emacs & disown'
alias weather='curl wttr.in'
alias wifi='/bin/bash list_wifi.sh'

# Nicer command outputs
alias ls='ls --color=auto'
alias els='els --els-icons=fontawesome' # did not get this to work yet with urxvt
alias grep='grep --color=auto'
alias tg='telegram-cli -N'


# Corresponding functions

command_not_found_handle() {
    echo ":-(" 
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
#echo Date: $(date +%F)
#echo Time: $(date +%T)
#echo $(acpi)

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

export PATH=~/Jason/scripts/:$PATH
export PATH="/home/edwin/miniconda3/bin:$PATH"
