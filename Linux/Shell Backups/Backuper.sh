#!/bin/sh

date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
backup=${dest}/${item}/${item}

if [ ! -z "ls ${src}/*" ]; then
	if [ ! -d "${dest}/" ]; then
		echo "|| Making backup directory... ||"
		sudo mkdir "${dest}/"
		echo "|| Directory made. ||"
	fi

	if [ ! -d "${dest}/${item}/" ]; then
		echo "|| Making directory for ${item}... ||"
		sudo mkdir "${dest}/${item}/"
		echo "|| Directory made. ||"
	fi

	echo "|| Backing up ${item}... ||"
	sudo 7z a -t7z "${backup}.7z" "${srce}/*" -r
	echo "|| Archived. ||"

	if [ -e "${backup}3.7z" ]; then
		sudo rm -f "${backup}3.7z"
	fi 

	if [ -e "${backup}2.7z" ]; then
		sudo mv "${backup}2.7z" "${backup}3.7z"
	fi

	if [ -e "${backup}1.7z" ]; then
		sudo mv "${backup}1.7z" "${backup}2.7z"
	fi

	if [ -e "${backup}.7z" ]; then
		sudo mv "${backup}.7z" "${backup}1.7z"
	fi

	if [ -e "${backup}.7z" ]; then
		echo "|| This means something wrong has happened. Check your sources and destinations. ||"
		sudo rm -f "${backup}.7z"
	fi
	echo "|| Backed up ${item}. ||"
else
	echo "|| Source for ${item} is empty or nonexistant. Skipping... ||"
fi
exit