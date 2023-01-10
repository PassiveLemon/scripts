$version = 0.3

Write-Output "|| This script will download directly to this directory. Are you sure this is where you want to download? ||"
Read-Host "|| press enter to continue. ||"

Write-Output "|| Downloading version v%version%… ||"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/fholger/vrperfkit/releases/latest/download/vrperfkit_v$version.zip -OutFile vrperfkit_v$version.zip -UseBasicParsing
Expand-Archive -Path .\vrperfkit_v$version.zip -DestinationPath .\

Write-Output "|| Downloaded. Cleaning up... ||"
Remove-Item -Path .\vrperfkit_v$version.zip,.\README.md,.\LICENSE -Force
Read-Host "|| Press enter to exit. ||"
exit
