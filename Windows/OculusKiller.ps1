Write-Output "|| Script must be run with administrator priviledges. ||"
Write-Output "|| If you are running with admininistrator priviledges, continue. ||"
Write-Output "|| Killing Oculus services... ||"
Stop-Process -Name OVRServiceLauncher -Force
Stop-Process -Name OVRServer_x64 -Force
Stop-Process -Name OVRRedir -Force

$cdr = "C:\Program Files\Oculus\Support\oculus-dash\dash\bin"

Write-Output "|| Checking for install directory... ||"
if (!(Test-Path $cdr\OculusDash.exe)) {
  Write-Output "|| Oculus.exe was not detected in "$cdr" ||"
  Write-Output "|| Exiting install script... ||"
  exit
} else {
  Write-Output "|| Install found. Proceeding... ||"
}

Write-Output "|| Backing up original exe if there isn't one already... ||"
if (!(Test-Path $cdr\OculusDash.exe.bak)) {
  Rename-Item $cdr\OculusDash.exe -NewName $cdr\OculusDash.exe.bak
}
Remove-Item $cdr\OculusDash.exe -Force

Write-Output "|| Downloading Oculus Killer... ||"
Set-Location $cdr
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/OpenOculus/OculusKiller/releases/latest/download/OculusDash.exe -OutFile OculusDash.exe -UseBasicParsing

Write-Output "|| Finished. ||"
Read-Host "|| Press enter to exit. ||"
exit
