# This script runs after SSH in Ubuntu instances
# Pack and upload files
if [ ! -f ~/build/compile.log ] || [ -f /tmp/stop ] ; then
printf "No file uploads. Skipping"
else
cd ~/build
sudo tar -cvpf output.tar output
sudo xz output.tar
sha1sum output.tar.xz
sha1sum compile.log
# curl -sL https://git.io/file-transfer | sh
wget https://github.com/Mikubill/transfer/releases/download/v0.4.8-beta/transfer_0.4.8-beta2_linux_amd64.tar.gz
tar -zxvf transfer_0.4.8-beta2_linux_amd64.tar.gz
sudo ./transfer gof ~/build/output.tar.xz
#./transfer wet ~/build/output.tar.xz
sudo ./transfer gof ~/build/compile.log
#./transfer wet ~/build/compile.log.xz
fi
