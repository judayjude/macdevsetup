#!/bin/bash

GITARGS=$@

cd ./$(git rev-parse --show-cdup 2>/dev/null)
git rev-parse --show-cdup 2>/dev/null && cd ..

printf "\n\n"
for DIR in $(ls -d */) ; do
	DIR=${DIR%%/}
	cd $DIR
	if [ -e "./.git" ]; then
		echo "$DIR"
		printf "============================\n"
		git $@
		printf "\n\n\n"
	fi
	cd - &>/dev/null
done
