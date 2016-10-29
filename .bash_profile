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
export GIT_EDITOR=gnuclient

#
# Identify the OS, architecture, and hostname
os=$(uname -s)
arch=$(uname -p)
host=$(hostname)

export PATH=$HOME/bin:$PATH


case $os in
Linux)
	export PATH=/usr/local/bin:$PATH

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
if [ -d $HOME/.bash_local.d ]; then
	for file in $HOME/.bash_local.d/*.sh
	do
		. $file
	done
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
export PS1="\h \w > "
export PS2="2> "
export PS3="3> "
