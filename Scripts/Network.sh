#!/bin/bash

NETWORK=$(nmcli | grep "wlp3s0b1" | grep "disconnected" >>/dev/null; echo $?) # Am I connected to a network?

if [[ $NETWORK == 1 ]]; then
	true # Do nothing

elif [[ $NETWORK == 0 ]]; then
	IS_CHADFIELD_ACTIVE=$(nmcli dev wifi list | grep "chadfield" >>/dev/null; echo $?) # Is my hotspot enabled?

	if [[ $IS_CHADFIELD_ACTIVE == 1 ]]; then
		true # Do nothing
	
	elif [[ $IS_CHADFIELD_ACTIVE == 0 ]]; then
		nmcli dev wifi connect chadfield # Connect to chadfield
	fi

	AM_I_HOME=$(nmcli dev wifi list | grep "BELL529" >>/dev/null; echo $?) # Am I home?

	if [[ $AM_I_HOME == 1 ]]; then
		true # Do nothing
	
	elif [[ $AM_I_HOME == 0 ]]; then
		nmcli dev wifi connect BELL529 # Connect to home network
	fi
fi
