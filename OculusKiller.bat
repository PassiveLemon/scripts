@echo off

echo "|| Script must be run with administrator priviledges. ||"
echo "|| If you are running with admininistrator priviledges, continue. ||"
pause

echo "|| Killing Oculus services... ||"
taskkill /f /im OVRServiceLauncher.exe
taskkill /f /im OVRServer_x64.exe
taskkill /f /im OVRRedir.exe

echo "|| Checking for install directory... ||"
if not exist "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe" (
	echo "|| Oculus.exe was not detected in "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\" ||"
	echo "|| Exiting install script... ||"
	exit
) else (
	echo "|| Install found. Proceeding... ||"
)

echo "|| Backing up original exe if there isn't one already... ||"
if not exist "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak" (
	ren "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe" OculusDash.exe.bak
)
del /s /q "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe"

echo "|| Downloading Oculus Killer... ||"
cd "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\"
curl -LO https://github.com/OpenOculus/OculusKiller/releases/download/v1.2.0/OculusDash.exe

echo "|| Finished. ||"
pause
exit
