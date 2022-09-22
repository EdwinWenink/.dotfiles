# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Path to your oh-my-zsh installation.
export ZSH="/home/edwin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=minimal

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting zsh-vim-mode)

source $ZSH/oh-my-zsh.sh


# User configuration

# Slightly adjust prompt from minimal theme
PROMPT='%2~ $(vcs_status)λ %b'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bashconfig='vim /etc/bash.bashrc'
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

# Variables
export NOTES=/home/edwin/Documents/Notes
export WEBSITE=/home/edwin/Website/personal_website

# (Vim-like) bindings
bindkey '^k' up-history
bindkey '^j' down-history
bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

command_not_found_handle() {
    echo "x" 
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/edwin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/edwin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/edwin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/edwin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
