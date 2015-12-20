export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:$HOME/bin:/usr/bin:$HOME/scripts:$HOME/.local/bin:$CASS_HOME/bin 
#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"

eval $( dircolors -b $HOME/src/LS_COLORS/LS_COLORS )


### start mpd ###
if [ ! -s $HOME/.config/mpd/pid ]; then
	mpd > /dev/null 2>&1;
	if [ $? -ne 0 ]; then
		echo "MPD didn't start";
	else
		echo "Started MPD"
	fi
fi

# I definitely swiped this for somewhere once upon time.
# If anyone know from where, I'd like to give credit.
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local DEEPBLUE="\[\033[38;05;27m\]"
  local WARMBLUE="\[\033[38;05;69m\]"
  local BLOOD="\[\033[38;05;196m\]"

if [ $(uname) == "Linux" ]; then
	local NICEPROMPT="\n$WHITEBOLD[\t]$WARMBLUE \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ ";
elif [ $(uname) == "FreeBSD" ]; then
	local NICEPROMPT="\n$WHITEBOLD[\t]$BLOOD \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ ";
else
	local NICEPROMPT="\n$WHITEBOLD[\t]$WHITEBOLD \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ ";
fi
	  
if $( svn info > /dev/null 2>&1 ); [[ $? == 0 ]]; then
        export PS1=$CYANBOLD\(\(\(~~subversion~~\)\)\)$NICEPROMPT
elif $( git rev-parse > /dev/null 2>&1 ); [[ $? == 0 ]]; then
        export PS1=$GREENBOLD\(\(\(~~git~~\)\)\)$NICEPROMPT
elif $( hg identify > /dev/null 2>&1 ); [[ $? == 0 ]]; then
        export PS1=$YELLOWBOLD\(\(\(~~mercurial~~\)\)\)$NICEPROMPT
else
        export PS1=$NICEPROMPT
fi
}
prompt

function cd() {
	builtin cd "$@" && prompt;
}

function vmstart() { 
	if [[ "$1" = "windows_7" ]]; then
		VBoxManage startvm $1 --type gui
	else
		VBoxManage startvm $1 --type headless
	fi
}

function vmrunning() {
        VBoxManage list runningvms
}
function vmlist() {
	VBoxManage list vms
}

function vmsave() {
	VBoxManage controlvm $1 savestate
}

function doom() {
	chocolate-doom ;
}

##### aliases

alias ls='ls --color=always'
alias vi='vim'
alias tmux='tmux -2'

http_proxy="http://localhost:8118"


#### python ####
. $HOME/.local/bin/virtualenvwrapper.sh

#### perl ####
export PERLBREW_ROOT=$HOME/.perl5/perlbrew
. $HOME/.perl5/perlbrew/etc/bashrc

