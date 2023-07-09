#!/bin/bash

pushd "$HOME" > /dev/null 2>&1 || return

files=".bash_profile .bashrc .gitconfig .git-completionsh .git-prompt.sh .xemacs elisp"

for file in $files
do
	[ -f "$file" ] || [ -d "$file" ] && mv "$file" "$file".bak

	rm -f "$file"

	#ln -s $HOME/dotfiles/$file .
	ln -s "dotfiles/$file" .
	
done

popd || return

# shellcheck source=/dev/null
. "$HOME/.bash_profile"


	
