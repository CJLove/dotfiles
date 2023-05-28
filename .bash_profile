#!/bin/bash
#
# Common bash profile
#

#
# SSH X forwarding
#
export SSH_X="-Y"

export EDITOR=vim

#
# GIT setup
#
#export GIT_EDITOR=gnuclient

#
# Identify the OS, architecture, kernel and hostname
os=$(uname -s)
arch=$(uname -p)
kern=$(uname -r)

export PATH=$HOME/bin:$PATH

export GOPATH=$HOME/go

case $os in
Linux)
	export PATH=/usr/local/go/bin:/opt/cc65/bin:/usr/local/bin:$HOME/.local/bin:$PATH
	[ -d /var/lib/snapd/snap/bin ] && export PATH=/var/lib/snapd/snap/bin:$PATH

	export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH

	export MANPATH=/usr/local/man:$MANPATH

	export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

	;;
CYGWIN*)
	export PATH=/opt/cc65/bin:/usr/local/bin:$PATH
	alias x16emu='/mnt/d/x16/x16emu_win-r37/x16emu.exe -rom "D:\x16\x16emu_win-r37\rom.bin"'
	;;
FreeBSD)
	export SSH_X="-X"
	;;
SunOS)
	;;
*)
	;;
esac

#
# Handle host-specific additions
#
if [ -d "$HOME"/.bash_profile.d ]; then
	for file in "$HOME"/.bash_profile.d/*.sh
	do
		# shellcheck source=/dev/null
		. "$file"
	done
fi

if [ -d "$HOME/.cargo/bin" ]; then
	export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
fi

#
# Get aliases for other local machines
#
if [ -f "$HOME/.bashrc" ]; then
	# shellcheck source=/dev/null
	. "$HOME/.bashrc"
fi

#
# Prompts
#
wslhost="\h"
if [[ "$kern" == *"microsoft"* ]]; then
	# WSL2...
	os=$(grep "^ID=" /etc/os-release|cut -f2 -d'=')
	ver=$(grep "^VERSION_ID=" /etc/os-release|cut -f2 -d'=')

	wslhost="$os $ver"
fi
if [[ "$os" == "CYGWIN"* ]]; then
	# Cygwin
	wslhost="cygwin"
fi
if [[ "$arch" == "s390x" ]]; then
	# s390x container
	wslhost="ubuntu-s390x"
fi
export PS1='$wslhost \w > '
if [ -f ~/.git-completion.sh ]; then
	# shellcheck source=/dev/null
	source "$HOME/.git-completion.sh"
fi
if [ -f ~/.git-prompt.sh ]; then
	# shellcheck source=/dev/null
	source "$HOME/.git-prompt.sh"
	#export PS1='\h \w $(__git_ps1 " (%s)") > '

	export PS1="$wslhost"' \w $(__git_ps1 "(%s)") > '
fi
export PS2="2> "
export PS3="3> "

