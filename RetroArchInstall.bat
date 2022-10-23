@echo off

echo "|| Downloading RetroArch... ||"
curl -LO https://buildbot.libretro.com/stable/1.12.0/windows/x86_64/RetroArch.7z
"C:\Program Files\7-Zip\7z.exe" x RetroArch.7z -o*

echo "|| Checking for install directory and replacing files... ||"
if exist "C:\Program Files (x86)\Steam\steamapps\common\RetroArch\retroarch.exe" (
	echo "|| Installation found in C:\ ||"
	xcopy /Y /s "RetroArch\RetroArch-Win64\*" "C:\Program Files (x86)\Steam\steamapps\common\RetroArch\"
	goto success
)

if exist "D:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe" (
	echo "|| Installation found in D:\ ||"
	xcopy /Y /s "RetroArch\RetroArch-Win64\*" "D:\SteamLibrary\steamapps\common\RetroArch\"
	goto success
) else (
	goto error
)

:error (
	echo "|| Installation was not found in C:\ or D:\. Make sure you have it installed in one of those drives. Otherwise, patch it yourself. ||"
	goto clean
)

:success (
	echo "|| Finished. ||"
	goto clean
)

:clean (
	echo "|| Cleaning up... ||"
	del /q RetroArch.7z
	rd /s /q RetroArch
	pause
	exit
)
