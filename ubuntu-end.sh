# This script runs after SSH in Ubuntu instances
# Pack and upload files
if [ ! -f ~/build/output/compile.log ] || [ -f /tmp/stop ] ; then
printf "No file uploads. Skipping"
else
cd ~/build
tar -cvf output.tar output
xz output.tar
xz compile.log
# curl -sL https://git.io/file-transfer | sh
wget https://github.com/Mikubill/transfer/releases/download/v0.4.8-beta/transfer_0.4.8-beta_linux_amd64.tar.gz
tar -zxvf transfer_0.4.8-beta_linux_amd64.tar.gz
./transfer gof ~/build/output.tar.xz
./transfer wet ~/build/output.tar.xz
./transfer gof ~/build/compile.log.xz
./transfer wet ~/build/compile.log.xz
fi
