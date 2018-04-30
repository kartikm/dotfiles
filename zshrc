### .zshrc Kartik's zshrc
### Config is thanks to:
### Baishampayan Ghose <http://github.com/ghoseb/zshrc>
### Mika <http://grml.org/zsh-pony/>

# Load the completions stuff
autoload -U compinit
compinit

# History settings
HISTFILE=~/.zshistory
SAVEHIST=100000
HISTSIZE=100000
DIRSTACKSIZE=30

# ZSH Options
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups # push directories visited automatically onto stack
setopt autocd
setopt globdots # find dotfiles easier
setopt histreduceblanks
setopt histignorespace
setopt histignorealldups
setopt SH_WORD_SPLIT # passes "foo bar" as "foo" "bar" to commands. Backward compatibility with sh/ksh
setopt automenu # Automatically use menu completion after the second consecutive request for completion, for example by pressing the TAB key repeatedly
setopt cdablevars              # avoid the need for an explicit $
setopt nohup                   # and don't kill them, either
setopt listpacked              # compact completion lists
setopt nolisttypes             # show types in completion
setopt extendedglob            # weird & wacky pattern matching - yay zsh!
setopt completeinword          # not just at the end
setopt alwaystoend             # when complete from middle, move cursor
setopt correct                 # spelling correction
setopt nopromptcr              # don't add \n which overwrites cmds with no \n
unsetopt promptcr
setopt histverify              # when using ! cmds, confirm first
setopt interactivecomments     # escape commands so i can use them later
setopt printexitvalue          # alert me if something's failed

setopt HASH_CMDS
setopt HASH_DIRS
setopt NUMERIC_GLOB_SORT
setopt appendhistory beep nomatch
setopt PRINT_EXIT_VALUE
setopt SHARE_HISTORY # share history between open shells
setopt MARK_DIRS # adds slash to end of completed dirs
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt HIST_NO_STORE          # don't save 'history' cmd in history

# Useful pipe shortcuts
bindkey -s '^|l' " | less\n"                   # c-| l  pipe to less
bindkey -s '^|g' ' | grep ""^[OD'             # c-| g  pipe to grep
bindkey -s '^|a' " | awk '{print $}'^[OD^[OD"  # c-| a  pipe to awk
bindkey -s '^|s' ' | sed -e "s///g"^[OD^[OD^[OD^[OD' # c-| s  pipe to sed
bindkey -s '^|w' " | wc -l\n"                   # c-| w  pipe to wc

# Support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Prompts
export PS1="${GRAY}[${GREEN}%n@%m: %~/ ${GRAY}]${RED}%#$NOCOLOR "
export PS2="%_> "

# Emacs key bindings
bindkey -e

# For zsh to work well within Emacs
[[ $EMACS = t ]] && unsetopt zle

# ENV
export PAGER=/usr/bin/less
export PATH=$PATH:$HOME/.bin:/sbin:$HOME/.cabal/bin

# Completion styles
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete # Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST # Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes' # Include non-hidden directories in globbed file completions
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # Separate matches into groups
zstyle ':completion:*:matches' group 'yes' # Describe each match group.
zstyle ':completion:*:descriptions' format "%B---- %d%b" # Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b' # Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Aliases
alias bc='bc -l'
alias cl='clear'
alias c=cl
alias cls=cl
alias cp='nocorrect cp'         # no spelling correction on cp
alias mv='nocorrect mv -i'      # no spelling correction on mv
alias mkdir='nocorrect mkdir'   # no spelling correction on mkdir
alias vi='vim'                  # Vi IMproved
alias rm='nocorrect rm -i'      # interactive RM
alias l="ls -GlAh --color"
alias ls="ls --color"
alias latest="ls -lct1"
alias lt="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias clls="clear;ls -Glah --color"
alias pingg='ping -c 4 www.google.com'
alias psprunge="curl -s -F 'sprunge=<-' http://sprunge.us | xclip -i -selection clipboard"
alias grep='grep --colour=auto'
alias diff='colordiff'
alias cd..='cd ..'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias cl='clear'
alias sl=ls
alias aria2c='aria2c --file-allocation=none'
alias copy='rsync -aP'
alias spk='vim ~/.ssh/known_hosts'
alias gu-check='for i in */gu.po; do echo -n "$i: "; msgfmt $i -cv -o /dev/null; done;'
alias halt='sudo shutdown -h now'
alias reboot='sudo reboot'
alias dt='dmesg | tail'
alias dh='df -h'
alias dm='df -m'
alias x='startx'
alias wv='sudo wvdial'
alias i3lock=' i3lock -c 151610'
alias pdf='zathura'

# MW specefic
export MY_MW=/var/www/mw-master/core

core_clone() {
    git clone ssh://kartik@gerrit.wikimedia.org:29418/mediawiki/core.git $1;
}

ext_clone() {
    git clone ssh://kartik@gerrit.wikimedia.org:29418/mediawiki/extensions/$1;
}

localset() { vim $MY_MW/LocalSettings.php; }

mwupdate() { php $MY_MW/maintenance/update.php --quick; }

alias phpcsmw='phpcs -v -s --standard=/home/kartik/development/wikipedia/mw-tools-cs/MediaWiki --encoding=utf-8'

# git
alias amend='git commit -a --amend'
alias amendn='git commit -a --amend --no-edit'
alias btcs='git submodule update --init --recursive'
alias gc='git gc'
alias master='git checkout master'
alias mum='git fetch upstream; git merge upstream/master;'
alias prod='git checkout production'
alias pull='git checkout master && git pull'
alias review='git fetch gerrit; git review;'
alias gss='git show HEAD'
alias gst='git show --stat'

# Cucumber
cuke() { bundle exec cucumber $1; }
kbo() { export KEEP_BROWSER_OPEN=true; }

# Simple HTTP server
pshs() { python -m SimpleHTTPServer; }

# Random stuffs
alias entertain='mplayer "$(find "." -type f -regextype posix-egrep -regex ".*\.(avi|mkv|flv|mpg|mpeg|mp4|wmv|3gp|mov|divx)" | shuf -n1)"'
alias gdocs='google-chrome --app=http://docs.google.com'
alias rand='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias speed='python ~/.bin/speedtest-cli'
alias stardate='date "+%y%m.%d/%H%M"'   # from Joey
alias tzfix='sudo dpkg-reconfigure tzdata' # fix for timezone. Bug?

# Whothefuckisusingport!
# https://twitter.com/labfoo/status/583618592366796800
whothefuckisusingport() { lsof -i tcp:$*; }

# tor settings
alias google-chrome-tor='google-chrome --proxy-server="socks://127.0.0.1:9050"'

# Debian
export DEBEMAIL="kartik@debian.org"
export DEBFULLNAME="Kartik Mistry"
export EDITOR='vim'
export VISUAL='vim'

alias lintian='lintian -iIEcv --pedantic --color auto --no-tag-display-limit'
alias lintian-normal='lintian --color auto --no-tag-display-limit'
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'

# via: http://www.reddit.com/r/linux/comments/m28g2/what_tiny_yet_awesome_hacks_do_you_use/c2xi1ke
alias ae="sudo $EDITOR /etc/apt/sources.list"
alias ag="dpkg -l|grep"
alias aL="dpkg -L"

# Some stats
alias debs-by-size='grep-status -FStatus -sInstalled-Size,Package -n "install ok installed" | paste -sd "  \n" | sort -rn'
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# Dirs
alias core=/var/www/mw-master/core
alias cx=~/development/WP/repos/LE/CX/ContentTranslation
alias cxd=~/development/WP/repos/LE/CX/deploy
alias cxs=~/development/WP/repos/LE/CX/cxserver
alias twn=~/development/WP/repos/LE/translatewiki
alias tmpe=~/development/WP/repos/LE/TwnMainPage
alias tx=~/development/WP/repos/LE/Translate
alias ux=~/development/WP/repos/LE/UniversalLanguageSelector

# Logo
alias lg=~/.bin/ucblogo-6.0/logo

# fortunes-debian-hints
if [ -x /usr/games/fortune ]; then
 /usr/games/fortune debian-hints
 echo ""
fi

# Utility functions
# license check foo
# By: Kartik Mistry
lcheck() {
 licensecheck -r --copyright . > ../license-report.txt
 echo "----------------------------------" >> ../license-report.txt
 echo "We have probably found some more.." >> ../license-report.txt
 echo "----------------------------------" >> ../license-report.txt
 grep -irn "License" * >> ../license-report.txt
}

# histroy
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# wget like progress bar for cp
# source: http://chris-lamb.co.uk/2008/01/24/can-you-get-cp-to-give-a-progress-bar-like-wget/
cp_p() {
strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
      | awk '{
        count += $NF
            if (count % 10 == 0) {
               percent = count / total_size * 100
               printf "%3d%% [", percent
               for (i=0;i<=percent;i++)
                  printf "="
               printf ">"
               for (i=percent;i<100;i++)
                  printf " "
               printf "]\r"
            }
         }
         END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Only upgrade installed packages
# source: http://www.df7cb.de/blog/2010/Upgrading_only_installed_packages.html
safe_upgrade () {
 if [ "$*" ] ; then
  set -- $(dpkg -l "$@" | grep ^ii | awk '{ print $2 }')
   if [ "$*" ] ; then
    echo "apt-get install $@"
    sudo apt-get install "$@"
   else
  echo "Nothing to upgrade"
 fi
 else
  sudo apt-get upgrade
 fi
}

# cd+ls
# source: http://lifehacker.com/5662424/change-directories-and-view-files-in-one-custom-command
cdl () {
 cd $1; ls;
}

#Theme
source ~/.oh-my-zsh/themes/apple.zsh-theme

# misc
source ~/.oh-my-zsh/plugins/debian/debian.plugin.zsh
source ~/.oh-my-zsh/lib/git.zsh
source ~/.oh-my-zsh/plugins/cp/cp.plugin.zsh

umask 022
