@echo off

echo "|| Backing up... ||"
echo "|| This will show nothing until it is done. ||"

>logfile.txt 2>&1 (
	@echo "%DATE% - %TIME%"
	@echo "|| Backing up data... ||"
	for %%f in (item-*.*) do call %%f
	@echo "|| Data backed up. ||"
)

echo "|| Backed up. ||"

if exist "logfile3.txt" (
	echo "|| Removing oldest backup ||"
	del /Q "logfile3.txt"
)

if exist "logfile2.txt" (
	echo "|| Move 2 to 3 ||"
	ren "logfile2.txt" "logfile3.txt"
)

if exist "logfile1.txt" (
	echo "|| Move 1 to 2 ||"
	ren "logfile1.txt" "logfile2.txt"
)

if exist "logfile.txt" (
	echo "|| Move new backup to 1 ||"
	ren "logfile.txt" "logfile1.txt"
)

exit
