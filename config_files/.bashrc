# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#see if env variable TMUX is set, check if session exists, if it does attach to
# it, o.w. create a new session
#if [[ -z "$TMUX" ]] ;then
    #ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    #if [[ -z "$ID" ]] ;then # if not available create a new one
	#tmux new-session
    #else
	#tmux attach-session -t "$ID" # if available attach to it
    #fi
#fi

#if command -v tmux>/dev/null; then
  #[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

if command -v tmux>/dev/null; then
  if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then # && exec tmux
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]]; then # if not available create a new one
	exec tmux new-session
    else
	exec tmux attach-session -t ${ID} # if available attach to it
    fi
  fi
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ----------------- apparix alias --------------
function to () {
   if test "$2"; then
     cd "$(apparix "$1" "$2" || echo .)";
   else
     cd "$(apparix "$1" || echo .)";
   fi
   pwd
}
function bm () {
   if test "$2"; then
      apparix --add-mark "$1" "$2";
   elif test "$1"; then
      apparix --add-mark "$1";
   else
      apparix --add-mark;
   fi
}
function portal () {
   if test "$1"; then
      apparix --add-portal "$1";
   else
      apparix --add-portal;
   fi
}
# function to generate list of completions from .apparixrc
function _apparix_aliases ()
{   cur=$2
    dir=$3
    COMPREPLY=()
    if [ "$1" == "$3" ]
    then
        COMPREPLY=( $( cat $HOME/.apparix{rc,expand} | \
                       grep "j,.*$cur.*," | cut -f2 -d, ) )
    else
        dir=`apparix -favour rOl $dir 2>/dev/null` || return 0
        eval_compreply="COMPREPLY=( $(
            cd "$dir"
            \ls -d *$cur* | while read r
            do
                [[ -d "$r" ]] &&
                [[ $r == *$cur* ]] &&
                    echo \"${r// /\\ }\"
            done
            ) )"
        eval $eval_compreply
    fi
    return 0
}
# command to register the above to expand when the 'to' command's args are
# being expanded
complete -F _apparix_aliases to
# --------------- apparix alias end ------------
green="\[\e[01;32m\]"
cyan="\[\e[01;36m\]"
yellow="\[\e[01;33m\]"
reset="\[\e[00m\]"

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWDIRTY_STATE=1
#export PS1='\[\033[01;32m\]\u@\h\[\030[01;34m\]: \W\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
export PS1=$'\[\e[01;32m\]\u2192\[\e[00;36m\] \W\[\e[01;33m\]$(__git_ps1)\[\e[00m\] '
#export PS1="$green \u2192 $cyan \W$yellow\$(__git_ps1)$reset"

#source /opt/ros/indigo/setup.bash
source /opt/ros/kinetic/setup.bash
source /home/${USER}/catkin_ws/devel/setup.bash
export ROS_WORKSPACE=/home/${USER}/catkin_ws
export ROS_MASTER_URI=http://localhost:11311
export EDITOR='gvim'

# Author.: Ole J
# Date...: 23.03.2008
# License: Whatever

# Wraps a completion function
# make-completion-wrapper <actual completion function> <name of new func.>
#                         <command name> <list supplied arguments>
# eg.
#   alias agi='apt-get install'
#   make-completion-wrapper _apt_get _apt_get_install apt-get install
# defines a function called _apt_get_install (that's $2) that will complete
# the 'agi' alias. (complete -F _apt_get_install agi)
#
function make-completion-wrapper () {
    local function_name="$2"
    local arg_count=$(( $#-3 ))
    local comp_function_name="$1"
    local alias_string=$3
    #remove original func name, new func name
    shift 2
    local funktion="
function $function_name {
    ((COMP_CWORD+=$arg_count))
    COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} \"\" )
    #echo \"CW= \${COMP_WORDS[-2]}\"

    #echo \"CWs=\${COMP_WORDS[@]:-2}T\"
    if [[ \"\${#COMP_WORDS[@]}\" -gt 2 ]]
    then
      args=\$(printf \" %s\" \"\${COMP_WORDS[@]:-1}\")
      args=\${args:1}
      args=\${args::-1}
    else
      args=\$(printf \"%s \" \"\${COMP_WORDS[0]}\")
    fi
    #echo \"args=\${args}tt\"

    COMP_LINE=\"\${args}\"
    COMP_POINT=\"((\${#args}+1))\"
    "$comp_function_name"
}"
    eval "$funktion"
}

# example of using make-completion-wrapper
# and now the commands that are specific to this SO question
#alias gco='git checkout'
#
# we create a _git_checkout_mine function that will do the completion for "gco"
# using the completion function "_git"
#make-completion-wrapper _git _git_checkout_mine git checkout
#
# we tell bash to actually use _git_checkout_mine to complete "gco"
#complete -o bashdefault -o default -o nospace -F _git_checkout_mine gco

function mcd() {
  if [[ "$#" -eq 0 ]]
  then
    mkdir build;
    cd build;
  else
    mkdir $1;
    cd $1;
  fi
}

function rtd() {
  cd ..;
  rm -r $1;
  mb $1
}

function open() {
  xdg-open 2>/dev/null $@;
}

function mk() {
  make $@
}
source /usr/share/bash-completion/completions/make
make-completion-wrapper _make _make_${USER} make
complete -o bashdefault -o default -o nospace -F _make_${USER} mk 

function vmake() {
  VERBOSE=1 make $@
}
make-completion-wrapper _make _vmake_${USER} make
complete -o bashdefault -o default -o nospace -F _vmake_${USER} vmake 

function sagi() {
  sudo apt-get install $1;
}
source /usr/share/bash-completion/completions/apt-get
make-completion-wrapper _apt_get _apt_get_${USER} apt-get install
#complete -o bashdefault -o default -o nospace -F _apt_get_${USER} sagi 
complete -F _apt_get_${USER} sagi 

function cpi() { apt list --installed | grep $@; }
make-completion-wrapper _apt _apt_${USER} apt list --installed
complete -o bashdefault -o default -o nospace -F _apt_${USER} cpi 

function acs() { apt-cache search $@; }

function sor() { sudo optirun $@; }
function sorv() { sudo optirun -vv $@; }
function pdon() { sh /home/laxit/.enable_palm_detect.sh; }
function tapon() { sudo optirun /home/laxit/.enable_touchpad_tap.sh; }

function catmake() {
  cd ~/catkin_ws;
  catkin_make $@;
  cd -;
}
make-completion-wrapper catkin_make _catkin_make_${USER} catkin_make
complete -o bashdefault -o default -o nospace -F _catkin_make_${USER} catmake 

function catless() { catdoc $@ | less; }
make-completion-wrapper _minimal _minimal_${USER} catdoc
complete -o bashdefault -o default -o nospace -F _minimal_${USER} catless 

function findit() { find . -iname $@; }
function findiT() { find . -name $@; }

function gitkbg() { gitk --all $@ & 1>/dev/null 2>&1; }

function matlabnd() { matlab -nodesktop $@; }

function ignore_catkin_pkg() { touch CATKIN_IGNORE; }
function ccmake_catkin() { ccmake ~/catkin_ws/build; }

alias src='source ~/.bashrc'

export LM_LICENSE_FILE=/usr/local/MATLAB/R2016b/license.dat
export PATH=$PATH:/usr/local/MATLAB/R2016b/bin

#Num of C-d needs to be pressed before terminal quits.
IGNOREEOF=1
