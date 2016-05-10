export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:$HOME/bin:/usr/bin:$HOME/scripts:$HOME/scripts/tmux-sessions:$HOME/.local/bin:$HOME/.local/sbin:$HOME/Library/Python/2.7/bin:$ECLIPSE_HOME:$GOPATH/bin
export LC_ALL=en_US.UTF-8 export LANG=en_US.UTF-8

if [[ $(uname) == "Darwin" ]]; then
	eval $( gdircolors -b /Users/cpk/.LS_COLORS ) || eval $( dircolors -b /Users/cpk/.LS_COLORS )
fi

export EDITOR=vim

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

  if [[ $(uname) == "Darwin" ]]; then
          local NICEPROMPT="\n$WHITEBOLD[\t]$PURPLEBOLD \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ "
  elif [[ $(uname) == "FreeBSD" ]]; then
          local NICEPROMPT="\n$WHITEBOLD[\t]$BLOOD \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ "
  elif [[ $(uname) == "Linux" ]]; then
          local NICEPROMPT="\n$WHITEBOLD[\t]$WARMBLUE \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ "
  else
          local NICEPROMPT="\n$WHITEBOLD[\t]$GREENBOLD \u@\h\[\033[00m\]:$WARMBLUE\w\[\033[00m\] \\$ "
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

##### VirtualBox wrappers

function vmnat() {
        if [ $# -lt 4 ]; then
                printf "Usage: vmnat <vmname | uuid> <rule name> <host port> <guest port>\n"
        else
                VBoxManage modifyvm $1 --natpf1 $2,tcp,,$3,,$4
        fi
}

function vmnatremove() {
        VBoxManage modifyvm $1 natpf1 delete foremanweb
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

function vmpause() {
        VBoxManage controlvm $1 pause
}

function vmresume() {
        VBoxManage controlvm $1 resume
}

function xvmstart() {
if [ $# -ne 1 ]; then
        printf "No VM listed. Please choose a VM from the following list:\n"
        xvmlist;
        exit 1;
else
        tmux has-session -t "xhyve" 2>&1
        if [ $? -eq 0 ]; then
                echo "we in here"
                tmux attach-session -d -s "xhyve"
        else
                tmux new-session -d -c $HOME -n $1 -s "xhyve" $XHYVE_HOME/$1/start.sh
                tmux switch-client -t "xhyve"
        fi
fi
}
function xvmlist() {
        ls $XHYVE_HOME
}

function ts() {
if [ $# -ne 1 ]; then
        echo $#
        printf "No session specified.\nChoose a session from the list using 'ts <session-name>'\n\n"
        tl
else
        tmux attach-session -t $1
fi
}
function tl() {
        tmux list-sessions
}


##### aliases

alias ls='gls --color=always'
alias vi='vim'
alias tmux='tmux -2'

#### Modular bash includes

export BASH_INCLUDES=$HOME/.bashrc.d/*.inc
for include in $BASH_INCLUDES; do
        if [ -e $include ]; then
                . $include;
        fi
done
