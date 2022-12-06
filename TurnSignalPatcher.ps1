$clean = @"
	Write-Output "|| Cleaning up... ||"
	Remove-Item -Path .\TurnSignalBuild.zip -Force
	Remove-Item -Path .\TurnSignalBuilds\ -Recurse -Force
	Read-Host "|| Press enter to exit. ||"
	exit
"@

Write-Output "|| Downloading patched version... ||"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/kylerk/TurnSignal/releases/download/2.4.6KWK/TurnSignalBuild.zip -OutFile TurnSignalBuild.zip -UseBasicParsing
Expand-Archive -Path .\TurnSignalBuild.zip -DestinationPath .\

Write-Output "|| Checking for install directory and replacing files... ||"
if (Test-Path "C:\Program Files (x86)\Steam\steamapps\common\TurnSignal\TurnSignal.exe") {
	Write-Output "|| Installation found in C:\ ||"
	Copy-Item -Path ".\TurnSignalBuilds\*" -Destination "C:\Program Files (x86)\Steam\steamapps\common\TurnSignal\" -Force
	Write-Output "|| Finished. ||"
	Invoke-Expression $clean
}

if (Test-Path "D:\SteamLibrary\steamapps\common\TurnSignal\TurnSignal.exe") {
	Write-Output "|| Installation found in D:\ ||"
	Copy-Item -Path ".\TurnSignalBuilds\*" -Destination "D:\SteamLibary\steamapps\common\TurnSignal\" -Force
	Write-Output "|| Finished. ||"
	Invoke-Expression $clean
} else {
	Write-Output "|| Installation was not found in C:\ or D:\. Make sure you have it installed in one of those drives. Otherwise, patch it yourself. ||"
	Invoke-Expression $clean
}
