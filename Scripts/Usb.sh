#!/bin/bash

# Is my USB available?
# This will detect a specific block with 57 GiB
# If you would like to change it, run 'lsblk' in your cli and grab the number before the decimal and replace
# 57 with that number
IF_USB_AVAIL=$(lsblk | grep "sdb1" | grep "57" >>/dev/null; echo $?)

# Will do nothing if it CANNOT detect a USB.
if [[ $IF_USB_AVAIL == 1 ]]; then
	true

elif [[ $IF_USB_AVAIL == 0 ]]; then
	
	# Is it already mounted?
	CHECK_MOUNT=$(lsblk | grep "sdb1" | grep "mountable" >>/dev/null; echo $?)

	if [[ $CHECK_MOUNT == 1 ]]; then
		# Mount the USB
		sudo mount /dev/sdb1 /home/rena/mountable
	
	elif [[ $CHECK_MOUNT == 0 ]]; then
		true # Do nothing
	fi
fi
