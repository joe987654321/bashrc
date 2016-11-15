# .bashrc

#alias ls="ls --color -F"
alias ls="ls -GF"

#for YAHOO
alias yerr="tail -f /home/y/logs/yapache/error"
alias yacc="tail -f /home/y/logs/yapache/access | readlog -f date,method,duration,status,url"
alias jerr="tail -f /home/y/logs/yjava_jetty/yjava_jetty.out"
alias jacc="tail -f /home/y/logs/yjava_jetty/access | readlog -f date,method,duration,status,url"
alias s="sudo"
alias y='yinst'
alias yi='yinst install'
alias yls='yinst ls'
alias yset='yinst set'
alias yp='yinst package'
alias yres='yinst restart'
alias yrep='yinst repair'
alias tcp='sudo tcpdump -A -l -s0'
alias tcpf='sudo nevec_tcpflow not port 22'
alias ssh='ssh -A'
alias grep='grep --color'
alias cleanycb='sudo rm -rf /home/y/var/ycb /home/y/var/run/ycb; yrep yglobal -yes; sudo chmod 1777 /home/y/var/run'
alias vproxyk3v='ssh -D 1082 proxy1.ops.k3v.yahoo.com'
alias vproxytcv='ssh -D 1083 proxy1.ops.tcv.yahoo.com'
alias vproxytwv='ssh -D 1084 proxy1.ops.twv.yahoo.com'
alias yyzd='mysql -uroot -p yyzd --default-character-set=utf8'
alias dm='docker-machine'
alias d='docker'
alias init='ssh-add -D; ssh-add; ssh -A -p 222 sshra.ops.yahoo.com IFVer=2 req=joe321@outerfish-lm'

function dt(){
	date -d "@$1"
}

function dts(){
	date -j -f "%a %b %d %T %Z %Y" "$1" "+%s"
}

#enables color in the terminal bash shell

#colorful PS1

PS1="["
PS1="$PS1\[\e[36m\]\u\[\e[0m\]"
PS1="$PS1@"
if [ "x$YROOT_NAME" != "x" ]; then
	# Yroot Indicator
	PS1="$PS1\[\e[32;40m\]$YROOT_NAME\[\e[0m\]"
	PS1="$PS1@"
fi
PS1="$PS1\[\e[34;1m\]\h\[\e[0m\]"
PS1="$PS1 \w]"
PS1="$PS1\\$ "

export PS1

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#autocomplete yroot
if [ -f /home/y/etc/yroot/yroot.bashrc ]; then
	. /home/y/etc/yroot/yroot.bashrc
fi

#autocomplete git
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# User specific aliases and functions

export SVN_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
export LC_ALL=C
export TERM=xterm-256color
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:"
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

#http://unix.stackexchange.com/questions/79042/how-can-i-fix-this-ssh-hostname-tab-completion-script
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
