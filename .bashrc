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
