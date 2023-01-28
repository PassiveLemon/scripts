version="1.14.0"

defaultdir="$HOME/.steam/steam/steamapps/common/RetroArch"

echo "|| Checking for install directory and replacing files... ||"
if [ -e ${defaultdir}/retroarch.sh ]; then
	echo "|| Installation found in $HOME/.steam/steam/steamapps/common/. ||"
	cd ${defaultdir}
	echo "|| Downloading cores... ||"
	curl -L --output ${defaultdir}/RetroArch_cores.7z https://buildbot.libretro.com/stable/${version}/linux/x86_64/RetroArch_cores.7z
	7z x RetroArch_cores.7z -o* -aoa
	sudo cp -rf ${defaultdir}/RetroArch-Linux-x86_64/RetroArch-Linux-x86_64.AppImage.home/.config/retroarch/cores/* ${defaultdir}/cores/
	echo "|| Downloading info files... ||"
	curl -L --output ${defaultdir}/info.zip https://buildbot.libretro.com/assets/frontend/info.zip
	unzip info.zip -d RetroArchInfo/
	sudo cp -rf ${defaultdir}/RetroArchInfo/* ${defaultdir}/cores/
	echo "|| Finished. ||"
	echo "|| Cleaning up... ||"
	sudo rm -f ${defaultdir}/RetroArch_cores.7z
	sudo rm -f ${defaultdir}/info.zip
	sudo rm -rf ${defaultdir}/RetroArch_cores/
	sudo rm -rf ${defaultdir}/RetroArchInfo/
	read -rsp $"|| Press enter to exit. ||"
	exit
else
	"|| Installation was not in $HOME/.steam/steam/steamapps/common/. Make sure you have it in there or patch it yourself. ||"
	read -rsp $"|| Press enter to exit. ||"
	exit
fi
