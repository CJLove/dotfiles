# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -d $HOME/.cargo ] && source $HOME/.cargo/env

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
alias ash='ssh $SSH_X ash.local'
alias pine='ssh $SSH_X pine.local'
alias birch='ssh $SSH_X birch.local'

alias pithos='flatpak run io.github.Pithos'


function setupGcc910 {
	echo "Setting up for gcc 9.1.0..."
	export PATH=/opt/gcc910/bin:$PATH
	export LD_LIBRARY_PATH=/opt/gcc910/lib64:$LD_LIBRARY_PATH
	export PS1="gcc910 \h \w > "
}

function setupGcc840 {
        echo "Setting up for gcc 8.4.0..."
        export PATH=/opt/gcc840/bin:$PATH
        export LD_LIBRARY_PATH=/opt/gcc840/lib64:$LD_LIBRARY_PATH
        export PS1="gcc840 \h \w > "
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


function setupGcc530 {
	echo "Setting up for gcc 5.3.0..."
	export PATH=/usr/local/gcc53/bin:$PATH
	export LD_LIBRARY_PATH=/usr/local/gcc53/lib64:$LD_LIBRARY_PATH
	export PS1="gcc530 \h \w > "
}

function setupGcc493 {
	echo "Setting up for gcc 4.9.3..."
	export PATH=/usr/local/gcc493/bin:$PATH
	export LD_LIBRARY_PATH=/usr/local/gcc493/lib64:$LD_LIBRARY_PATH
	export PS1="gcc490 \h \w > "
}

function setupCC65 {
	echo "Setting up for cc65 dev..."
	export PATH=/opt/cc65/bin:$PATH
	export PS1="cc65 dev \h \w > "
}

alias gcc910='setupGcc910'
alias gcc840='setupGcc840'
alias gcc740='setupGcc740'
alias gcc650='setupGcc650'
alias gcc530='setupGcc530'
alias gcc493='setupGcc493'
alias cc65dev='setupCC65'

alias dotfiles='cd ~/dotfiles'
alias serfcpp='cd ~/Development/serf-cpp'
alias configcpp='cd ~/Development/config-cpp'

alias x16emur37='~/Software/X16.r37/x16emu -rom ~/Software/X16.r37/rom.bin'
alias x16emur38='~/Software/X16.r38/x16emu -rom ~/Software/X16.r38/rom.bin'
alias x16emur39='~/Software/X16.r39/x16emu -rom ~/Software/X16.r39/rom.bin'

alias opengrok='sudo su - opengrok' 
alias nginx='sudo su - nginx'
alias wiki='sudo su - wiki'
alias jenkins='sudo su - jenkins'

alias lr='cd $HOME/Development/x16-LodeRunner'
alias cr='cd $HOME/Development/x16-ChopperRaid'
alias lx16='cd $HOME/Development/libX16'
alias lx16test='cd $HOME/Development/libX16Test'

alias s390x='podman run --rm -it --net host -v /home/love:/root/ --cap-add sys_ptrace fir.local:3005/s390x/ubuntu-s390x /bin/bash -l'
