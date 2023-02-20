# Dynamic Variables

name=
src=
des=

# Static variables (For the sake of simplification)

backup=${dest}/${name}

# Backuper

if [ -e ${src}/* ]; then
	7z a ${src/   ---> ${backup}.7z
	
	if [ -e ${backup}3.7z ]; then
		sudo rm -f ${backup}3.7z
	fi 

	if [ -e ${backup}2.7z ]; then
		sudo mv ${backup}2.7z ${backup}3.7z
	fi
	if [ -e ${backup}1.7z ]; then
		sudo mv ${backup}2.7z ${backup}2.7z
	fi
	if [ -e ${backup}.7z ]; then
		sudo mv ${backup}2.7z ${backup}1.7z
	fi
	if [ -e ${backup}.7z ]; then
		echi "|| Something weird happened. ||"
		sudo rm -f ${backup}.7z
	fi
else
	echo "|| Source is empty or nonexistant. Skipping... ||"
fi