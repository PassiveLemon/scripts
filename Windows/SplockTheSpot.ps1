Write-Output "|| Installing Spicetify... ||"
Invoke-WebRequest -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | Invoke-Expression
Invoke-WebRequest -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | Invoke-Expression
spicetify apply

Write-Output "|| Installing BlockTheSpot... ||"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression "& { $((Invoke-WebRequest -useb 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content) } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_on -cache_off -block_update_off -exp_standart -hide_col_icon_off -start_spoti"

Write-Output "|| Spotify patched. ||"
Read-Host "|| Press enter to exit. ||"
exit
