# ~/.bash_aliases

# Define os specific alias
if [ "$(uname)" == "Darwin" ]; then
    # coreutils
    alias shuf="gshuf"
    alias realpath="grealpath"
    alias md5sum="gmd5sum"
    alias rm="grm"
    alias ls="gls --color"
    alias dir="gdir --color"
    alias vdir="gvdir --color"
    alias cp="gcp"
    alias head="ghead"
    alias du="gdu"

    # grep
    alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'

    # disk eject
    alias disk-list='diskutil list'
    alias disk-unmount='diskutil unmountDisk '
    alias disk-eject='diskutil eject '

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # ls
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    alias tmux="tmux -2"   
    alias dstatio="dstat -d -n --top-io --disk-util"

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    :;
    # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    :;
    # Do something under 64 bits Windows NT platform
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Color define
red=$'\e[35;01m'
green=$'\e[32;01m'
orange=$'\e[33;01m'
white=$'\e[1;01m'
grey=$'\e[30;01m'
endcolor=$'\e[m'
alias echo='echo -e'

# Define Server

# Alias for tree
alias tree='tree -ACN'

# Alias for git
alias gitlogauto='git log --oneline --graph --all '

# Alias for ctags
alias ctags-with-variable-for-c++='ctags --c++-kinds=+l '
alias ctags-with-cuda='ctags --c++-kinds=+l --langmap=C++:+.cu '

# Alias for dropbox
alias db='dropbox_uploader.sh '

# Alias for look the file size
alias hdu='du -sk -- * | sort -n | perl -pe '\''@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'\'''

# Wget with continue and try infinite times
alias wget-auto='wget -c -t 0 '

# Open stuff in Gnome with open.
alias open='xdg-open &>/dev/null'

