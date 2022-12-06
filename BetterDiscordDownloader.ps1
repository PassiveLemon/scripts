Write-Output "|| Downloading BD installer... ||"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe -OutFile BetterDiscord-Windows.exe -UseBasicParsing

Write-Output "|| Launching installer... ||"
Start-Process -Filepath .\BetterDiscord-Windows.exe

#Write-Output "|| Finished. Cleaning up... ||"
#Remove-Item -Path .\BetterDiscord-Windows.exe -NoNewWindow -Wait
# Above does not work for some reason so you have to remove the exe yourself.
