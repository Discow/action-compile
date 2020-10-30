# This script runs after SSH in Ubuntu instances
# Pack and upload files
if [ ! -d ~/build/output ] || [ -f /tmp/stop ] ; then
printf "No file uploads. Skipping"
else
cd ~/build
tar -cvf output.tar output
xz output.tar
xz compile.log
curl -sL https://git.io/file-transfer | sh
./transfer gof ~/build/output.tar.xz
./transfer wet ~/build/output.tar.xz
./transfer gof ~/build/compile.log.xz
./transfer wet ~/build/compile.log.xz
fi
