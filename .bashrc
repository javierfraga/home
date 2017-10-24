# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
source ~/.alias
source ~/.mvn-color.sh
source ~/.gitrc
export TERM=xterm-256color
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Anaconda install location:
#export PATH=/home/javier/updates/python-packages/anaconda/bin:$PATH

# Install npm packages globally without sudo on OS X and Linux
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# add */sbin directories: 
# http://unix.stackexchange.com/questions/232782/is-there-a-reason-i-would-not-add-usr-local-sbin-usr-sbin-sbin-to-my-path-o
# adds /sbin, if does not already have
[[ ":$PATH:" != *":/sbin:"* ]] && PATH=$PATH:/sbin
# adds /usr/local/sbin, if does not already have
[[ ":$PATH:" != *":/usr/local/sbin:"* ]] && PATH=$PATH:/usr/local/sbin
# outproc is for color console output with bash commande, be sure to install
# http://zaufi.github.io/pluggable-output-processor.html
# there are some typos in code, see bash/outproc bookmarks saved soln.
# adds /usr/bin/outproc, if exist and does not already have
if [ -f /usr/bin/outproc ]; then
    [[ ":$PATH:" != *":/usr/bin/outproc:"* ]] && PATH=/usr/bin/outproc:$PATH
fi
# adds /usr/lib/outproc/bin, if exist and does not already have
if [ -d /usr/lib/outproc/bin ]; then
    [[ ":$PATH:" != *":/usr/lib/outproc/bin:"* ]] && PATH=/usr/lib/outproc/bin:$PATH
fi
# adds /usr/lib64/outproc/bin, if exist and does not already have
if [ -d /usr/lib64/outproc/bin ]; then
    [[ ":$PATH:" != *":/usr/lib64/outproc/bin:"* ]] && PATH=/usr/lib64/outproc/bin:$PATH
fi

# adds mongodb standalone to PATH
PATH=$PATH:/home/javier/updates/mongodb/bin/

# karma chrome path for webdriver
export CHROME_BIN=/usr/bin/google-chrome-stable

# local go lang path
export GOPATH=$HOME/.go

# cygwin windows7 needed setting for tmux pane split and new window
# http://unix.stackexchange.com/questions/12032/create-new-window-with-current-directory-in-tmux
if [ "$(uname -o)" == "Cygwin" ]; then
	PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
fi

# set default editor, neovim only for linux
if [ "$(uname -s)" == "Linux" ]; then
	export EDITOR=vim
fi

# check if program is installed
command_exists () {
    command -v "$1" > /dev/null 2>&1;
}

# so I can use only one 'vim' command
vimSwitch () {
	if command_exists nvim ; then
		nvim $@
	elif command_exists gvim ; then

		gvim -v $@
	else
		\vim $@
	fi
}

for_each_do (){
	for i in `$1`; do
		$2 $i	
	done
	#TODO: solve way to pass unique id for 'file' and 'result'
	#for file in `ls /media/sf_javier/dda+b2b-release-10.16/`; do
		#for result in `find . -name $file`; do
			#cp -i /media/sf_javier/dda+b2b-release-10.16/$file $result
		#done
		#echo "---------------"
	#done
}
runOnce (){
	pgrep $@ > /dev/null || ($@ &)
}
get_sesc(){
    if [[ -f /media/sf_vm-share/hpca/sesc.opt ]]; then
        mv /media/sf_vm-share/hpca/sesc.opt ~/sesc/
        echo "copied new sesc.opt"
    else
        echo "no copy file does not exist!!"
    fi
}

#paramter $1 is the binary for simulated machine
#paramter $2 name to append output files
project2Old(){
    get-sesc
    ~/sesc/sesc.opt -f $2 -c ~/sesc/confs/cmp4-noc.conf -iInput/input.256 -otest.out -etest.err $1 -p 1 > output.$2
    #~/sesc/sesc.opt $@
    mv -i sesc_$1.$2 project[0-3]/
    mv -i output.$2 project[0-3]/
    cat test.out
    cat test.err
}
# parameter $1 is the name of the binary for the simulated machine
# paramter $2 is the tag name for report and cout output file
lastStepHpca() {
    mv -i sesc_$1.$2 project[0-3]/
    mv -i output.$2 project[0-3]/
    cat $3.out
    cat $3.err
}

#required $1 is the tag name for report and cout output file
#required $2 is threads
#optional $3 is additional option parameter
project3(){
    if [[ -z "$1 " ||  -z "$2" ]]; then
        echo "ERROR missing paramters"
        echo "* required \$1 is the tag name for report and cout output file"
        echo "* required \$2 is threads"
        echo "* optional \$3 is additional option parameter"
        echo "* examples:"
        echo "p3 test 4"
        echo "p3 test 4 tee"
        echo "p3 test 4 redir"
    elif [[ $3 = "tee" ]]; then
        get-sesc
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp16-noc.conf -olu.out -elu.err lu.mipseb -n512 -p$2 | tee output.$1
        lastStepHpca lu.mipseb $1 lu
    elif [[ $3 = "redir" ]]; then
        get-sesc
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp16-noc.conf -olu.out -elu.err lu.mipseb -n512 -p$2 > output.$1
        lastStepHpca lu.mipseb $1 lu
    else
        get-sesc
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp16-noc.conf -olu.out -elu.err lu.mipseb -n512 -p$2
    fi
}

#required $1 is the tag name for report and cout output file
#optional $2 is additional option parameter
project2(){
    if [[ -z "$1" ]]; then
        echo "ERROR missing paramters"
        echo "* required \$1 is the tag name for report and cout output file"
        echo "* optional \$2 is additional option parameter"
        echo "* examples:"
        echo "p2 test"
        echo "p2 test tee"
        echo "p2 test redir"
    elif [[ $2 = "tee" ]]; then
        get-sesc
        grep --color=auto -n -E "\[DMemory\]" ~/sesc/confs/cmp4-noc.conf -A 16
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp4-noc.conf -iInput/input.256 -ofmm.out -efmm.err fmm.mipseb -p 1 | tee output.$1
        lastStepHpca fmm.mipseb $1 fmm
    elif [[ $2 = "redir" ]]; then
        get-sesc
        grep --color=auto -n -E "\[DMemory\]" ~/sesc/confs/cmp4-noc.conf -A 16
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp4-noc.conf -iInput/input.256 -ofmm.out -efmm.err fmm.mipseb -p 1 > output.$1
        lastStepHpca fmm.mipseb $1 fmm
    else
        get-sesc
        grep --color=auto -n -E "\[DMemory\]" ~/sesc/confs/cmp4-noc.conf -A 16
        ~/sesc/sesc.opt -f $1 -c ~/sesc/confs/cmp4-noc.conf -iInput/input.256 -ofmm.out -efmm.err fmm.mipseb -p 1
    fi
}
