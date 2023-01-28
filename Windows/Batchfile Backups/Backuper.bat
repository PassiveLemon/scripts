@echo off

dir /b /s /a "%srce%\" | findstr .>nul || (
	echo "|| Nothing detected in source directory or directory does not exist for %item%. Skipping... ||"
	goto skip
)

if not exist "%dest%\" (
	echo "|| Making backup directory... ||"
	mkdir "%dest%\"
	echo "|| Directory made. ||"
)

if not exist "%dest%\%item%\" (
	echo "|| Making directory for %item%... ||"
	mkdir "%dest%\%item%\"
	echo "|| Directory made. ||"
)

echo "|| Archiving... ||"
	"C:\Program Files\7-Zip\7z.exe" a -t7z "%dest%\%item%\%item%.7z" "%srce%\*.*" -r

if exist "%dest%\%item%\%item%3.7z" (
	echo "|| Removing oldest backup ||"
	del /Q "%dest%\%item%\%item%3.7z"
)

if exist "%dest%\%item%\%item%2.7z" (
	echo "|| Move 2 to 3 ||"
	ren "%dest%\%item%\%item%2.7z" "%item%3.7z"
)

if exist "%dest%\%item%\%item%1.7z" (
	echo "|| Move 1 to 2 ||"
	ren "%dest%\%item%\%item%1.7z" "%item%2.7z"
)

if exist "%dest%\%item%\%item%.7z" (
	echo "|| Move new backup to 1 ||"
	ren "%dest%\%item%\%item%.7z" "%item%1.7z"
)

if exist "%dest%\%item%\%item%.7z" (
	echo "|| Removing %item%.7z. This shouldn't happen. Check your entries. ||"
	del /Q "%dest%\%item%\%item%.7z"
)

echo "|| Successfully backed up %item% ||"

:skip
