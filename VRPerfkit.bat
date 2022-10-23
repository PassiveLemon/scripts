@echo off

set version=0.3

echo "|| This script will download directly to this directory. Are you sure this is where you want to download? ||"
pause

echo "|| Downloading version v%version%… ||"
curl -LO https://github.com/fholger/vrperfkit/releases/download/v%version%/vrperfkit_v%version%.zip
tar -xf vrperfkit_v%version%.zip

echo "|| Downloaded. Cleaning up... ||'
del /q vrperfkit_v%version%.zip LICENSE README.md
exit
