# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

#ignores faltoo commands
export HISTIGNORE="&:ls:[bf]g:exit"

# records all session's history
# http://www.bradshawenterprises.com/blog/2008/09/27/5-ways-to-make-using-bash-more-productive/
shopt -s histappend
PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# A color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#Josh's prompt from: http://maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04
PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

#enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

#For colourful man pages (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#for easy navigation in shell!
alias cd..='cd ..'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias cl='clear'
alias grep='grep --colour=auto'

#make sure we don't do horrible things..
alias rm='rm -i'

alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

alias diff='colordiff'
alias vless='/usr/share/vim/vim72/macros/less.sh'

#from Joey :)
alias stardate='date "+%y%m.%d/%H%M"'

#debmail
export DEBEMAIL=kartik@debian.org

#macbook right click hack
#xmodmap -e "keycode 115 = Pointer_Button3"

#fortunes-debian-hints
if [ -x /usr/games/fortune ]; then
  /usr/games/fortune debian-hints
  echo ""
fi

#apt-cache function from LG
ac () { /usr/bin/apt-cache search "$@"|LESS=FX /usr/bin/less; }
export -f ac
export NACL_INC_DIR=/home/kartik/nacl/build/include/x86
export NACL_LIB_DIR=/home/kartik/nacl/build/lib/x86

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
