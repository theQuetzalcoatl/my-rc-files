# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth; # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=10000

export EDITOR="/usr/bin/nano";

shopt -s histappend; # append to the history file, don't overwrite it
shopt -s checkwinsize; # update cols and rows upon soize change
shopt -s globstar;

# GIT BRANCH DISPLAY
function parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'; # [\1] will appear around branch, change it to {} e.g.
}

function get_result()
{
	last_command_result=$?;
	if [[ ${last_command_result} -ne 0 ]]; then
		echo -n -e "\033[38;2;0;0;255m[\033[38;2;250;0;0mX\033[38;2;0;0;255m]";
	fi
}

PS1='$(get_result)\033[38;2;0;0;255m[\t]$(parse_git_branch) \033[00m\033[48;2;19;63;62m\w\033[00m\n❯ ';

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [[ -f ~/.bash_aliases ]]; then source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi
