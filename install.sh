#!/bin/bash

pushd $HOME > /dev/null 2>&1

files=".bash_profile .bashrc .gitconfig .git-completion.sh .git-prompt.sh .xemacs elisp"

for file in $files
do
	[ -f $file -o -d $file ] && mv $file $file.bak

	rm -f $file

	#ln -s $HOME/dotfiles/$file .
	ln -s dotfiles/$file .
	
done

. $HOME/.bash_profile


	
