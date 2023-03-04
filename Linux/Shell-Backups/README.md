# shell-backups </br>
Backups using shell. </br>
After given a source directory, this will create a 7z of your source at a desired location.</br>

# Features </br>
- If you already have 7zip, it is simple to setup.
- Compresses files to save space.
- Will make 3 versions. Lowest number is the most recent.
- Will skip locked/in use files. This may be good or bad depending on your needs.
- Will ignore nonexistant/empty directories and keep your previous versions.
- Logs its activities.

# Usage </br>
Make sure you have 7zip. </br>
Download files in this repo. </br>
Put files in a safe location. </br>
Edit the Template.sh with your backup location. (DO NOT ADD A / TO THE END.) </br>
Copy and paste that Template script for the amount of things you want to backup. </br>
Put each script into `Items/`and change the name to `(whatever you want).sh`. The file name doesn't really matter but it should be correct for organizational purposes. </br>
For each item's shell file, put the name at the top and the source (The directory that you want to backup. DO NOT ADD A / TO THE END.) Example file included. </br>

To have it done automatically, use Cron, Systemd, or a program of your choice and have it run Starter.sh. This is what automatically runs all of the subscripts and creates the logs. </br>
