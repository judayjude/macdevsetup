#!/bin/bash

if [[ -f ~/.m2/settings.xml ]] ; then
	echo "~/.m2/settings.xml already exists. Will not overwrite. Exiting"
	exit 1
fi

echo -n "DEVSNC username: "
read username
echo -n "DEVSNC password: "
read -s userpass

curl -u ${username}:${userpass} https://artifact.devsnc.com/service/local/templates/settings/devsnc/content > ~/.m2/settings.xml

echo "Remember to substitute your credentials in ~/.m2/settings.xml"
echo "They will need to be encrypted (ask BuildEng for help)."
