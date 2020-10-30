# Execute "touch /tmp/continue" after compilation is complete
prepare() {
A="`jobs | grep compile`"
while [[ $A == "" ]]; do
sleep 15
done
touch /tmp/continue
}

nohup prepare &
