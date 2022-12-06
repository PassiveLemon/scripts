$clean = @"
	Write-Output "|| Cleaning up... ||"
	Remove-Item -Path .\RetroArch.7z -Force
	Remove-Item -Path .\RetroArch\ -Recurse -Force
	Read-Host "|| Press enter to exit. ||"
	exit
"@

Write-Output "|| Downloading RetroArch.7z... ||"
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri https://buildbot.libretro.com/stable/1.12.0/windows/x86_64/RetroArch.7z -OutFile RetroArch.7z -UseBasicParsing
. "C:\Program Files\7-Zip\7z.exe" x RetroArch.7z -o* -aoa

Write-Output "|| Checking for install directory and replacing files... ||"
if (Test-Path "C:\Program Files (x86)\Steam\steamapps\common\RetroArch\retroarch.exe") {
	Write-Output "|| Installation found in C:\ ||"
	Copy-Item -Path ".\RetroArch\RetroArch-Win64\*" -Destination "C:\Program Files (x86)\Steam\steamapps\common\RetroArch\" -Force
	Write-Output "|| Finished. ||"
	Invoke-Expression $clean
}

if (Test-Path "D:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe") {
	Write-Output "|| Installation found in D:\ ||"
	Copy-Item -Path ".\RetroArch\RetroArch-Win64\*" -Destination "D:\SteamLibrary\steamapps\common\RetroArch\" -Force
	Write-Output "|| Finished. ||"
	Invoke-Expression $clean
} else {
	Write-Output "|| Installation was not found in C:\ or D:\. Make sure you have it installed in one of those drives. Otherwise, patch it yourself. ||"
	Invoke-Expression $clean
}
