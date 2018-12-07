#!/bin/bash

SOURCEDIR=$(dirname $0)
FORCE=0

if [[ "$1" == "-f" ]] ; then
	FORCE=1
fi

# Bash Profile must already exist, abort otherwise
if [ -e ~/.bash_profile ] || [ "$FORCE" == "1" ] ; then
	touch ~/.bash_profile
else
	echo ".bash_profile does not exist in home directory.\n\nFirst, either create manually or by running ServiceNow homebrew setup\n\nSee REAMDME.md"
	exit 1
fi

linkInHomeDir() {
	local FILETOLINK=$1
	local TYPE=$2
	if [ -e ~/${FILETOLINK} ] || [ -L ~/${FILETOLINK} ] ; then
		echo "${FILETOLINK} ${TYPE} already exists in home directory."
		if [ "$FORCE" == "1" ] ; then
			echo "Overwriting existing ${TYPE}, setting up fresh link"
			rm -rf ~/${FILETOLINK}
			ln -s ${SOURCEDIR}/${FILETOLINK} ~/${FILETOLINK}
		else
			echo "Skipping link setup"
		fi
	else
		echo "Setting up ${TYPE} link for ${FILETOLINK} in home directory"
		ln -s ${SOURCEDIR}/${FILETOLINK} ~/${FILETOLINK}
	fi
}
			
# PS1 (command prompt settings)
linkInHomeDir ".ps1" "file"

# Vim settings
linkInHomeDir ".vimrc" "file"

# Alias plugin directory
linkInHomeDir "alias" "directory"

# Environ plugin directory
linkInHomeDir "env" "directory"

# Append Bash Profile with source commands for above plugin sets
linkInHomeDir ".bash_profile_ext" "file"
BPEXTSPATH=$(readlink ~/.bash_profile_ext)
EXTSRCCMD="source ~/.bash_profile_ext"
LINKCOUNT=$(grep -c -e "^${EXTSRCCMD}" ~/.bash_profile)
if [[ "$BPEXTPATH" == "${SOURCEDIR}/.bash_profile_ext" ]] && [[ "$LINKCOUNT" == "0" ]]; then
	echo "Sourcing .bash_profile_ext from ~/.bash_profile"
	echo "\n# Mac Dev Command Line Setup and Environment Overrides" >> ~/.bash_profile
	echo "${EXTSRCCMD}" >> ~/.bash_profile
else
	echo ".bash_profile_ext not the same as file shipped with this setup (or already sourced).  Skipping add as source to ~/.bash_profile"
fi
