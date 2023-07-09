#!/bin/bash
# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	# shellcheck source=/dev/null
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
alias ash='ssh $SSH_X ash.local'
alias pine='ssh $SSH_X pine.local'
alias birch='ssh $SSH_X birch.local'
alias aspen='ssh $SSH_X aspen.local'
alias larch='ssh $SSH_X larch.local'
alias ginkgo='ssh $SSH_X ginkgo.local'
alias acacia='ssh $SSH_X acacia.local'
alias balsa='ssh $SSH_X balsa.love.io'
alias apple='ssh $SSH_X apple.love.io'
alias palm='ssh $SSH_X palm.love.io'
alias cork='ssh $SSH_X cork.love.io'
alias oak='ssh $SSH_X oak.love.io'
alias elm='ssh $SSH_X elm.local'




function setupCC65 {
	echo "Setting up for cc65 dev..."
	export PATH=/opt/cc65/bin:$PATH
	export PS1="cc65 dev \h \w > "
}


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

function devImage {
	IMAGE=$1
	cp /etc/passwd /tmp/passwd.$$
	echo "$USER:x $(id -u):$(id -g):$USER:$HOME:/bin/bash" >> /tmp/passwd.$$
	cp /etc/group /tmp/group.$$
	echo "$USER:x:$(id -g):" >> /tmp/group.$$

	docker run --rm -it \
		--net=host \
		--privileged \
		-u "$(id -u):$(id -g)" \
		-v /tmp/passwd.$$:/etc/passwd \
		-v /tmp/group.$$:/etc/group \
		-v "$HOME:$HOME" \
		--cap-add=SYS_PTRACE \
		"fir.love.io:3005/amd64/$IMAGE:latest" /bin/bash -l 

	rm -f /tmp/passwd.$$ /tmp/group.$$	
}

# serf-cpp aliases
alias serf-cpp='cd $HOME/Development/serf-cpp'
alias serf-cpp-gcc493='devImage serf-cpp-gcc493'
alias serf-cpp-gcc530='devImage serf-cpp-gcc530'
alias serf-cpp-gcc650='devImage serf-cpp-gcc650'
alias serf-cpp-gcc740='devImage serf-cpp-gcc740'
alias serf-cpp-gcc840='devImage serf-cpp-gcc840'
alias serf-cpp-gcc940='devImage serf-cpp-gcc940'
alias serf-cpp-gcc1030='devImage serf-cpp-gcc1030'
alias serf-cpp-gcc1130='devImage serf-cpp-gcc1130'
alias serf-cpp-gcc1230='devImage serf-cpp-gcc1230'

# config-cpp aliases
alias config-cpp='cd $HOME/Development/config-cpp'
alias config-cpp-gcc650='devImage config-cpp-gcc650'
alias config-cpp-gcc740='devImage config-cpp-gcc740'
alias config-cpp-gcc840='devImage config-cpp-gcc840'
alias config-cpp-gcc940='devImage config-cpp-gcc940'
alias config-cpp-gcc1030='devImage config-cpp-gcc1030'
alias config-cpp-gcc1130='devImage config-cpp-gcc1130'
alias config-cpp-gcc1230='devImage config-cpp-gcc1230'

# msglib-cpp aliases
alias msglib-cpp='cd $HOME/Development/msglib-cpp'
alias msglib-cpp-gcc940='devImage msglib-cpp-gcc940'
alias msglib-cpp-gcc1030='devImage msglib-cpp-gcc1030'
alias msglib-cpp-gcc1130='devImage msglib-cpp-gcc1130'
alias msglib-cpp-gcc1230='devImage msglib-cpp-gcc1230'

# sockets-cpp aliases
alias sockets-cpp='cd $HOME/Development/sockets-cpp'
alias sockets-cpp-gcc840='devImage sockets-cpp-gcc840'
alias sockets-cpp-gcc940='devImage sockets-cpp-gcc940'
alias sockets-cpp-gcc1030='devImage sockets-cpp-gcc1030'
alias sockets-cpp-gcc1130='devImage sockets-cpp-gcc1130'
alias sockets-cpp-gcc1230='devImage sockets-cpp-gcc1230'

# gcc aliases
alias gcc1230='devImage gcc1230'
alias gcc1130='devImage gcc1130'
alias gcc1030='devImage gcc1030'
alias gcc940='devImage gcc940'
alias gcc840='devImage gcc840'
alias gcc740='devImage gcc740'
alias gcc650='devImage gcc650'
alias gcc530='devImage gcc530'
alias gcc493='devImage gcc493'

function s390x {
	cp /etc/passwd /tmp/passwd.$$
	echo "$USER:x $(id -u):$(id -g):$USER:$HOME:/bin/bash" >> /tmp/passwd.$$
	cp /etc/group /tmp/group.$$
	echo "$USER:x:$(id -g):" >> /tmp/group.$$

	podman run --rm -it \
		--net=host \
		--privileged \
		--userns=keep-id \
		-u "$(id -u):$(id -g)" \
		-v /tmp/passwd.$$:/etc/passwd \
		-v /tmp/group.$$:/etc/group \
		-v "$HOME:$HOME" \
		--cap-add=SYS_PTRACE \
		fir.love.io:3005/s390x/ubuntu-s390x /bin/bash -l

	rm -f /tmp/passwd.$$ /tmp/group.$$
}

#alias s390x='podman run --rm -it -u $(id -u):$(id -g) --net host -v /home/love:/root/ --cap-add sys_ptrace fir.love.io:3005/s390x/ubuntu-s390x /bin/bash -l'
