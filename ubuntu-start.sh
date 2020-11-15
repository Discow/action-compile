# This script runs before SSH in Ubuntu instances

## Example ##

# Setting the time zone
sudo timedatectl set-timezone "Asia/Shanghai"

# Clean up
sudo -E apt-get update
docker rmi `docker images -q`
sudo -E apt-get -y purge azure-cli ghc* zulu* hhvm llvm* firefox google* dotnet* openjdk* mysql* php*
sudo -E apt-get -y autoremove --purge
sudo rm -rf /usr/share/dotnet /etc/mysql /etc/php
sudo -E apt-get clean

# Install the tools you need to use
sudo -E apt-get update
sudo -E apt-get -y install liblz4-tool
#sudo -E apt-get -y install neofetch

# Download the armbian tool
cd ~
git clone https://github.com/armbian/build

# Download OrangePi_Build
git clone https://github.com/orangepi-xunlong/OrangePi_Build.git

