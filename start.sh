#!/usr/bin/env bash
DIR="$HOME/dotfiles"
FILES=(
	".bashrc"
	".vimrc"
	".gitconfig"
	".tmux.conf"
)
for file in "${FILES[@]}";do
	src="$DIR/$file"
	dest="$HOME/$file"
	if [ -L "$dest" ]; then
		echo "Symlink exists: $dest"
	elif [ -e "$dest" ]; then
		mv "$dest" "$dest.bak"
		echo "Backed up $dest to $dest.bak"
		ln -sf "$src" "$dest"
		echo "Linked $src -> $dest"
	else
		ln -sf "$src" "$dest"
		echo "Linked $src -> $dest"
	fi
done
