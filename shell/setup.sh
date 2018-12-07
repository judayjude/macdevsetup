#!/bin/bash

# Bash Profile must already exist, abort otherwise
if [ ! -e ~/.bash_profile ] ; then
	echo ".bash_profile does not exist in home directory.\n\nFirst, either create manually or by running ServiceNow homebrew setup\n\nSee REAMDME.md"
	exit 1
fi

# PS1 (command prompt settings)
if [ -e ~/.ps1 ] ; then
	echo ".ps1 file already exists in home directory.  Not overwriting."
else
	ln -s ./.ps1 ~/.ps1
fi

# Vim settings
if [ -e ~/.vimrc ] ; then
	echo ".vimrc file already exists in home directory.  Not overwriting."
else
	ln -s ./.vimrc ~/.vimrc
fi

# Alias plugin directory
if [ -e ~/alias ] ; then
	echo "file or dir 'alias' already exists in home directory.  Skipping step: add alias plugin dir symlink"
else
	ln -s ./alias ~/alias
fi

# Environ plugin directory
if [ -e ~/env ] ; then
        echo "file or dir 'env' already exists in home directory.  Skipping step: add env plugin dir symlink"
else
        ln -s ./env ~/env
fi

# Append Bash Profile with source commands for above plugin sets
if [ -e ~/.bash_profile_ext ] ; then
	echo ".bash_profile_ext file already exists in home directory.  Skipping step: source extension file from .bash_profile"
else
	ln -s ./bash_profile_ext >> ~/.bash_profile_ext
	echo "\n# Mac Dev Command Line Setup and Environment Overrides" >> ~/.bash_profile
	echo "source ~/.bash_profile_ext" >> ~/.bash_profile
fi
