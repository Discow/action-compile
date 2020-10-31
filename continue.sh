# Execute "touch /tmp/continue" after compilation is complete
TASK="`jobs | grep compile`"
until [[ $TASK == "" ]]; do
sleep 15
done
touch /tmp/continue
