# .profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/home/y/bin:/home/y/bin64:~/Downloads/apache-maven-3.2.3/bin:/usr/local/mysql/bin

export PATH

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
