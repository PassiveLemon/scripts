@echo off

echo "|| Downloading patched version... ||"
curl -LO https://github.com/kylerk/TurnSignal/releases/download/2.4.6KWK/TurnSignalBuild.zip
tar -xf TurnSignalBuild.zip

echo "|| Checking for install directory and replacing files... ||"
if exist "C:\Program Files (x86)\Steam\steamapps\common\TurnSignal\TurnSignal.exe" (
	echo "|| Installation found in C:\ ||"
	xcopy /Y /s "TurnSignalBuilds\*" "C:\Program Files (x86)\Steam\steamapps\common\TurnSignal\"
	goto success
)

if exist "D:\SteamLibrary\steamapps\common\TurnSignal\TurnSignal.exe" (
	echo "|| Installation found in D:\ ||"
	xcopy /Y /s "TurnSignalBuilds\*" "D:\SteamLibrary\steamapps\common\TurnSignal\"
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
	del /q TurnSignalBuild.zip
	rd /s /q TurnSignalBuilds
	pause
	exit
)
