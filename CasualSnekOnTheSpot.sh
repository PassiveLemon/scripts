sudo apt update
sudo apt upgrade

sudo apt install -y git python3-pip ffmpeg
sudo apt install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev

if [ -e onethespot/ ]; then
  cd onethespot/
else
  sudo git clone https://github.com/casualsnek/onethespot/
  cd onethespot/
  pip install -r requirements.txt
fi
python3 onthespot.py
