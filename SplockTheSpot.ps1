## This script installs Spicetify first, and then BlockTheSpot after.
## Note: This uninstalls the Microsoft store version of Spotify and downloads the standalone version.
## Another note: BlockTheSpot sometimes updates Spotify while installing so you might have to rerun the script for Spicetify to work.

## https://github.com/spicetify/
## https://github.com/mrpond/BlockTheSpot/

iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex
pause
iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex
pause
spicetify apply
pause

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex "& { $((iwr -useb 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content) } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_on -cache_off -block_update_off -exp_standart -hide_col_icon_off -start_spoti"
pause

## These 2 might not work together
