version="1.14.0"

defaultdir="${HOME}/.local/share/Steam/steamapps/common/RetroArch"

echo "|| Checking for install directory and replacing files... ||"
if [ -e ${defaultdir}/retroarch.sh ]; then
	echo "|| Installation found in ${HOME}/.local/share/Steam/steamapps/common/. ||"
	cd ${defaultdir}/

	echo "|| Downloading RetroArch... ||"
	mkdir -p ./RETROARCHINSTALLERTEMP/RetroArch/
	pushd ./RETROARCHINSTALLERTEMP/RetroArch/
	curl -L --output ./RetroArch.7z https://buildbot.libretro.com/stable/${version}/linux/x86_64/RetroArch.7z
	7z x RetroArch.7z
	sudo cp -r ./RetroArch-Linux-x86_64/RetroArch-Linux-x86_64.AppImage.home/.config/retroarch/* ${defaultdir}/
	popd

	echo "|| Downloading cores... ||"
	mkdir -p ./RETROARCHINSTALLERTEMP/Cores/
	pushd ./RETROARCHINSTALLERTEMP/Cores/
	curl -L --output ./RetroArch_cores.7z https://buildbot.libretro.com/stable/${version}/linux/x86_64/RetroArch_cores.7z
	7z x RetroArch_cores.7z
	sudo cp -r ./RetroArch-Linux-x86_64/RetroArch-Linux-x86_64.AppImage.home/.config/retroarch/cores/* ${defaultdir}/cores/
	popd

	echo "|| Downloading info files... ||"
	mkdir -p ./RETROARCHINSTALLERTEMP/Info/
	pushd ./RETROARCHINSTALLERTEMP/Info/
	curl -L --output ./info.zip https://buildbot.libretro.com/assets/frontend/info.zip
	unzip info.zip -d ./info/
	sudo cp -r ./info/* ${defaultdir}/cores/
	popd

	echo "|| Finished. Cleaning up... ||"
	sudo rm -rf ${defaultdir}/RETROARCHINSTALLERTEMP/
	read -rsp $"|| Press enter to exit. ||"
	exit
else
	"|| Installation was not in ${HOME}/.local/share/Steam/steamapps/common/. Make sure you have it in there or patch it yourself. ||"
	read -rsp $"|| Press enter to exit. ||"
	exit
fi
