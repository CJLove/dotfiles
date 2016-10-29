#!/bin/bash

pushd $HOME > /dev/null 2>&1

files=".bash_profile .bashrc .xemacs elisp"

for file in $files
do
	[ -f $file ] && mv $file $file.bak

	rm -f $file

	ln $HOME/dotfiles/$file .
done

	
