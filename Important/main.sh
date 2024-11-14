#!/bin/bash

USER=$(whoami)
MAIN_DIR=$(find /home/$USER -type d -name 'Important' | head -n 1)
CONF_DIR=$(find /home/$USER -type d -name 'Celestia' | head -n 1)

#	PACKAGE CHECK


IS_PACKAGE_ENABLED=$(grep "Packages" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_PACKAGE_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh packages &
elif [[ $IS_PACKAGE_ENABLED == "0" ]]; then
	true
fi


#	WALLPAPERPLUS CHECK


IS_WALLPAPERPLUS_ENABLED=$(grep "swww Wallpaper" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_WALLPAPERPLUS_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh wallpaper &
elif [[ $IS_WALLPAPERPLUS_ENABLED == "0" ]]; then
	true
fi


#	BAR CHECK


IS_BAR_ENABLED=$(grep "Bar" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_BAR_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh bar &
elif [[ $IS_BAR_ENABLED == "0" ]]; then
	true
fi


#	celestia KITTY


IS_KITTY_ENABLED=$(grep "Kitty" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_KITTY_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh kitty &
elif [[ $IS_KITTY_ENABLED == "0" ]]; then
	true
fi


#	NETWORK CHECK


IS_NETWORK_ENABLED=$(grep "NETWORK" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_NETWORK_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh network &
elif [[ $IS_NETWORK_ENABLED == "0" ]]; then
	true
fi


#	USB CHECK


IS_USB_ENABLED=$(grep "USB" $CONF_DIR/celestia.conf | grep "0" >>/dev/null; echo $?)

if [[ $IS_USB_ENABLED == "1" ]]; then
	$MAIN_DIR/call.sh usb &
elif [[ $IS_USB_ENABLED == "0" ]]; then
	true
fi
