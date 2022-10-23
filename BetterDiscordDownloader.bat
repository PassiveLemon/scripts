@echo off

echo "|| Downloading BD installer... ||"
curl -LO https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe

echo "|| Launching installer... ||"
call BetterDiscord-Windows.exe

echo "|| Finished. Cleaning up... ||"
del BetterDiscord-Windows.exe
exit