# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
# General aliases
#
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -lt'

#
# Setup for specific developments
#
#
# Alias for 32-bit java
#
alias java32='$HOME/Java/jdk1.7.0_51_x86/bin/java'
alias java64='$HOME/Java/jdk1.7.0.51_x86/bin/java'


#
# Virtual machines (depend on entries in /etc/hosts)
#
alias fir='ssh $SSH_X fir'
alias chasm='ssh $SSH_X chasm'
alias pi1='ssh $SSH_X pi1'
alias pi2='ssh $SSH_X pi2'


function setupGcc910 {
	echo "Setting up for gcc 9.1.0..."
	export PATH=/opt/gcc910/bin:$PATH
	export LD_LIBRARY_PATH=/opt/gcc910/lib64:$LD_LIBRARY_PATH
	export PS1="gcc910 \h \w > "
}

function setupGcc740 {
	echo "Setting up for gcc 7.4.0..."
	export PATH=/opt/gcc740/bin:$PATH
	export LD_LIBRARY_PATH=/opt/gcc740/lib64:$LD_LIBRARY_PATH
	export PS1="gcc740 \h \w > "
}


function setupGcc650 {
	echo "Setting up for gcc 6.5.0..."
	export PATH=/opt/gcc650/bin:$PATH
	export LD_LIBRARY_PATH=/opt/gcc650/lib64:$LD_LIBRARY_PATH
	export PS1="gcc650 \h \w > "
}

alias gcc910='setupGcc910'
alias gcc740='setupGcc740'
alias gcc650='setupGcc650'

alias dotfiles='cd ~/dotfiles'
alias serfcpp='cd ~/Development/serf-cpp'
alias configcpp='cd ~/Development/config-cpp'
