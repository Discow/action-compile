# Execute "touch /tmp/continue" after compilation is complete
TASK="`jobs | grep compile`"
while [[ $TASK == "" ]]; do
sleep 15
done
touch /tmp/continue
