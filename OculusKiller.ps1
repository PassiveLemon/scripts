Write-Output "|| Script must be run with administrator priviledges. ||"
Write-Output "|| If you are running with admininistrator priviledges, continue. ||"
Write-Output "|| Killing Oculus services... ||"
Stop-Process -Name OVRServiceLauncher -Force
Stop-Process -Name OVRServer_x64 -Force
Stop-Process -Name OVRRedir -Force

Write-Output "|| Checking for install directory... ||"
if (!(Test-Path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe")) {
    Write-Output "|| Oculus.exe was not detected in "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\" ||"
    Write-Output "|| Exiting install script... ||"
    exit
} else {
    Write-Output "|| Install found. Proceeding... ||"
}

Write-Output "|| Backing up original exe if there isn't one already... ||"
if (!(Test-Path "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak")) {
    Rename-Item "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe" -NewName "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe.bak"
}
Remove-Item "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\OculusDash.exe" -Force

Write-Output "|| Downloading Oculus Killer... ||"
Set-Location "C:\Program Files\Oculus\Support\oculus-dash\dash\bin\"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/OpenOculus/OculusKiller/releases/download/v1.2.0/OculusDash.exe -OutFile OculusDash.exe -UseBasicParsing

Write-Output "|| Finished. ||"
Read-Host "|| Press enter to exit. ||"
exit
