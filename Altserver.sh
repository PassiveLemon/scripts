sudo apt update -y
sudo apt upgrade -y
sudo apt install -y usbmuxd libimobiledevice6 libimobiledevice-utils wget curl libavahi-compat-libdnssd-dev unzip screen psmisc

sudo mkdir -p ./altserver/
cd ./altserver/
if [ -e run.sh ]; then
  sudo chmod +x ./run.sh
  sudo bash ./run.sh
else
  echo "|| AltServer not installed. Installing... ||"
  sudo curl -LO https://github.com/powenn/AltServer-Linux-ShellScript/releases/download/0.3.6/AltServer-x64.zip
  sudo unzip AltServer-x64.zip
  sudo cp -r ./AltServer-x64/* .
  sudo chmod +x ./run.sh
  echo "|| AltServer has been installed. Cleaning up... ||"
  sudo rm -r ./AltServer-x64.zip
  sudo bash ./run.sh
fi
