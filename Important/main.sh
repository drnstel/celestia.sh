#!/bin/bash

USER=$(whoami)
MAIN_DIR=$(find /home/$USER -type d -name 'Important' | head -n 1)
CONF_DIR=$(find /home/$USER -type d -name 'Celestia' | head -n 1)

# Package Check


IS_PACKAGE_ENABLED=$(grep "Packages" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_PACKAGE_ENABLED == "1" ] ; then
	$MAIN_DIR/call.sh packages &
elif [ $IS_PACKAGE_ENABLED == "0" ] ; then
	true
fi


# Wallpaper Check


IS_WALLPAPERPLUS_ENABLED=$(grep "swww Wallpaper" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_WALLPAPERPLUS_ENABLED == "1" ] ; then
	$MAIN_DIR/call.sh wallpaper &
elif [ $IS_WALLPAPERPLUS_ENABLED == "0" ] ; then
	true
fi


# Bar Check


IS_BAR_ENABLED=$(grep "Bar" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_BAR_ENABLED == "1" ] ; then
	$MAIN_DIR/call.sh bar &
elif [ $IS_BAR_ENABLED == "0" ] ; then
	true
fi


# Terminal Check


IS_TERMINAL_ENABLED=$(grep "Terminal" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_TERMINAL_ENABLED == "1" ] ; then

	WHICH_STATED=$(grep 'Emulator = ' $CONF_DIR/celestia.conf);	WHICH_STATED=$(WHICH_STATED##*=)
	STATED=$(echo $WHICH_STATED | tr -d ' ')
	
	if [ $IS_TERMINAL_ENABLED == "kitty" ]; then
		$MAIN_DIR/call.sh terminal kitty
	elif [ $IS_TERMINAL_ENABLED == "foot" ]; then
		$MAIN_DIR/call.sh terminal foot
	fi

elif [ $IS_TERMINAL_ENABLED == "0" ] ; then
	true
fi


# Network Check


IS_NETWORK_ENABLED=$(grep "Network" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_NETWORK_ENABLED == "1" ] ; then
	$MAIN_DIR/call.sh network &
elif [ $IS_NETWORK_ENABLED == "0" ] ; then
	true
fi


# Usb Check


IS_USB_ENABLED=$(grep "USB" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [ $IS_USB_ENABLED == "1" ] ; then
	$MAIN_DIR/call.sh usb &
elif [ $IS_USB_ENABLED == "0" ] ; then
	true
fi
