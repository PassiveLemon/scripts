$clean = @"
	Write-Output "|| Cleaning up... ||"
	Remove-Item -Path .\TurnSignalBuild.zip -Force
	Remove-Item -Path .\TurnSignalBuilds\ -Recurse -Force
	Read-Host "|| Press enter to exit. ||"
	exit
"@

$ProgressPreference = 'SilentlyContinue'
$download = @"
	Write-Output "|| Downloading patched version... ||"
	Invoke-WebRequest -Uri https://github.com/kylerk/TurnSignal/releases/download/2.4.6KWK/TurnSignalBuild.zip -OutFile TurnSignalBuild.zip -UseBasicParsing
	Expand-Archive -Path .\TurnSignalBuild.zip -DestinationPath .\
	Copy-Item -Path ".\TurnSignalBuilds\*" -Destination "$path" -Force -Recurse
	Write-Output "|| Finished. ||"
"@

$cdr = "C:\Program Files (x86)\Steam\steamapps\common\TurnSignal"
$ddr = "D:\SteamLibrary\steamapps\common\TurnSignal"

Write-Output "|| Checking for install directory and replacing files... ||"
if (Test-Path $cdr\TurnSignal.exe) {
	$path = $cdr
	Write-Output "|| Installation found in C:\ ||"
	Set-Location $cdr
	Invoke-Expression $download
	Invoke-Expression $clean
}

if (Test-Path $ddr\TurnSignal.exe) {
	$path = $ddr
	Write-Output "|| Installation found in D:\ ||"
	Set-Location $ddr
  Invoke-Expression $download
	Invoke-Expression $clean
} else {
	Write-Output "|| Installation was not found in C:\ or D:\. Make sure you have it installed in one of those drives. Otherwise, patch it yourself. ||"
}