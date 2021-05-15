#
# Common bash profile
#

#
# SSH X forwarding
#
export SSH_X="-Y"

#
# GIT setup
#
#export GIT_EDITOR=gnuclient

#
# Identify the OS, architecture, kernel and hostname
os=$(uname -s)
arch=$(uname -p)
kern=$(uname -r)
host=$(hostname)

export PATH=$HOME/bin:$PATH


case $os in
Linux)
	export PATH=/opt/cc65/bin:/usr/local/bin:$PATH

	export MANPATH=/usr/local/man:$MANPATH

	export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

	;;
CYGWIN*)
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
if [ -d $HOME/.bash_profile.d ]; then
	for file in $HOME/.bash_profile.d/*.sh
	do
		. $file
	done
fi

if [ -d "$HOME/.cargo/bin" ]; then
	export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
fi

#
# Get aliases for other local machines
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
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
export PS1='\h \w > '
if [ -f ~/.git-completion.sh ]; then
	source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
	#export PS1='\h \w $(__git_ps1 " (%s)") > '

	export PS1="$wslhost"' \w $(__git_ps1 "(%s)") > '
fi
export PS2="2> "
export PS3="3> "

