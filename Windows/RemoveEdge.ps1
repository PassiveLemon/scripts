Write-Output "|| Navigating to Edge location... ||"
Set-Location "C:\Program Files (x86)\Microsoft\Edge\Application\*.*.*.*\Installer\"

Write-Output "|| Opening a CMD to run the uninstall command... ||"
Start-Process cmd.exe -ArgumentList '/c "setup.exe --uninstall --system-level --verbose-logging --force-uninstall"'

Write-Output "|| Edge removed. ||"
Read-Host "|| Press enter to exit ||"
exit
