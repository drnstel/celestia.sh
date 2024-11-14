#!/bin/bash


CONF_DIR=$(find /home/$USER -type d -name 'celestia' | head -n 1)
SIZE_FINDER=$(grep 'Size = ' $CONF_DIR/celestia.conf); SIZE_FINDER=${SIZE_FINDER##*=}
SIZE=$(echo $SIZE_FINDER | tr -d ' ')
DIR_FINDER=$(grep 'Directory = ' $CONF_DIR/celestia.conf); DIR_FINDER=${DIR_FINDER##*=}
DIR=$(echo $DIR_FINDER | tr -d ' ')

IF_USB_AVAIL=$(lsblk | grep "sdb1" | grep "$SIZE" >>/dev/null; echo $?)

# Will do nothing if it CANNOT detect a USB.
if [[ $IF_USB_AVAIL == 1 ]]; then
	true

elif [[ $IF_USB_AVAIL == 0 ]]; then
	
	# Is it already mounted?
	CHECK_MOUNT=$(lsblk | grep "sdb1" | grep "$DIR" >>/dev/null; echo $?)

	if [[ $CHECK_MOUNT == 1 ]]; then
		# Mount the USB
		sudo mount /dev/sdb1 $DIR
	
	elif [[ $CHECK_MOUNT == 0 ]]; then
		true # Do nothing
	fi
fi
