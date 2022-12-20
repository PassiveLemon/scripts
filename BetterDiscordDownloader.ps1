Write-Output "|| Downloading BD installer... ||"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe -OutFile BetterDiscord-Windows.exe -UseBasicParsing

Write-Output "|| Launching installer... ||"
Start-Process -Filepath .\BetterDiscord-Windows.exe

#Write-Output "|| Finished. Cleaning up... ||"
#Remove-Item -Path BetterDiscord-Windows.exe
# Unlike with Batchfile, Powershell won't wait until the installer is closed to delete the exe so you will have to do that yourself.
