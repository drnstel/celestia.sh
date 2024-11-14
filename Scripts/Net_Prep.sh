#!/bin/bash

# Variable Creation
USER=$(whoami)
CONF_DIR=$(find /home/$USER -type d -name 'celestia' | head -n 1)
SCRIPT_DIR=$(find /home/$USER -type d -name 'Scripts' | head -n 1)
COUNT=1
ADDER=1
DEVICE_ID_GRABBER=$(grep 'Dev ID = ' $MAIN_DIR/celestia.conf); DEVICE_ID_GRABBER=${DEVICE_ID_GRABBER##*=}
ID=$(echo $DEVICE_ID_GRABBER | tr -d ' ')

# Check if Net.sh currently exists in /Scripts
CHECK_NET=$(find $SCRIPT_DIR -type f -name 'Net.sh' | head -n 1 >>/dev/null; echo $?)

# If it doesn't exist, create Net.sh.
if [ $CHECK_NET == "1" ]; then
    touch $SCRIPT_DIR/Net.sh
elif [ $CHECK_NET == "0" ]; then
    true
fi

# For EVERY network instance in network.conf, create a block.
for NETWORK in $(cat $CONF_DIR/network.conf)
do
    echo "NET$COUNT=\$(nmcli | grep "$ID" | grep "disconnected" >>/dev/null; echo $?) # Am I connected to a network?" >> $SCRIPT_DIR/Net.sh
    echo "if [[ \$NET$COUNT == 1 ]]; then" >> $SCRIPT_DIR/Net.sh
	echo "  true # Do nothing" >> $SCRIPT_DIR/Net.sh
    echo "" >> $SCRIPT_DIR/Net.sh
    echo "elif [[ \$NET$COUNT == 0 ]]; then" >> $SCRIPT_DIR/Net.sh
	echo "IS_NET$COUNT\_ON=\$(nmcli dev wifi list | grep "$NETWORK" >>/dev/null; echo $?) # Is $NETWORK currently online?" >> $SCRIPT_DIR/Net.sh
    echo "" >> $SCRIPT_DIR/Net.sh
	echo "  if [[ \$IS_NET$COUNT\_ON == 1 ]]; then" >> $SCRIPT_DIR/Net.sh
	echo "      true # Do nothing" >> $SCRIPT_DIR/Net.sh
    echo "" >> $SCRIPT_DIR/Net.sh
	echo "  elif [[ \$IS_NET$COUNT\_ON == 0 ]]; then" >> $SCRIPT_DIR/Net.sh
	echo "      nmcli dev wifi connect $NETWORK # Connect to $NETWORK" >> $SCRIPT_DIR/Net.sh
	echo "  fi" >> $SCRIPT_DIR/Net.sh
    echo "fi" >> $SCRIPT_DIR/Net.sh
    echo "" >> $SCRIPT_DIR/Net.sh
    COUNT=$(($COUNT + $ADDER))
done