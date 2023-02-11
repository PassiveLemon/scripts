Write-Output "|| RetroArchInstall ||"

$version = "1.14.0"

$clean = @"
	Write-Output "|| Cleaning up... ||"
	Remove-Item -Path .\RetroArch.7z -Force
	Remove-Item -Path .\RetroArch\ -Recurse -Force
	Read-Host "|| Press enter to continue. ||"
	exit
"@

$ProgressPreference = 'SilentlyContinue'
$download = @"
	Write-Output "|| Downloading RetroArch.7z... ||"
	Invoke-WebRequest -Uri https://buildbot.libretro.com/stable/$version/windows/x86_64/RetroArch.7z -OutFile RetroArch.7z -UseBasicParsing
	. "C:\Program Files\7-Zip\7z.exe" x RetroArch.7z -o* -aoa
	Copy-Item -Path ".\RetroArch\RetroArch-Win64\*" -Destination "$path" -Force -Recurse
	Write-Output "|| Finished. ||"
"@

$cdr = "C:\Program Files (x86)\Steam\steamapps\common\RetroArch"
$ddr = "D:\SteamLibrary\steamapps\common\RetroArch"

Write-Output "|| Checking for install directory and replacing files... ||"
if (Test-Path $cdr\retroarch.exe) {
	$path = $cdr
	Write-Output "|| Installation found in C:\ ||"
	Set-Location $cdr
	Invoke-Expression $download
	Invoke-Expression $clean
}

if (Test-Path $ddr\retroarch.exe) {
	$path = $ddr
	Write-Output "|| Installation found in D:\ ||"
	Set-Location $ddr
	Invoke-Expression $download
	Invoke-Expression $clean
} else {
	Write-Output "|| Installation was not found in C:\ or D:\. Make sure you have it installed in one of those drives. Otherwise, patch it yourself. ||"
	}
