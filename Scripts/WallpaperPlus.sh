#!/bin/bash

# Directory Finding
# The USER variable just checks for who the current user is.
# The MAIN_DIR variable locates the celestia folder.
USER=$(whoami)
MAIN_DIR=$(find /home/$USER -type d -name 'Celestia' | head -n 1)

# Checks the .conf file for the wallpaper the user states.
# If it works (praying), it should be fine.
PREWALLPAPER=$(grep 'Wallpaper = ' $MAIN_DIR/celestia.conf); PREWALLPAPER=${PREWALLPAPER##*=}
SEL_WALLPAPER=$(echo $PREWALLPAPER | tr -d ' ')

# Sets the wallpaper image that the user states.
swww img $MAIN_DIR/Wallpapers/$SEL_WALLPAPER

# Checks if swww is currently running.
WALLPAPER_CHECK=$(swww-daemon >>/dev/null; echo $?)

# Will run swww if swww is NOT currently running.
if [[ $WALLPAPER_CHECK == 1 ]]; then
	swww-daemon --format xrgb
elif [[ $WALLPAPER_CHECK == 0 ]]; then
	true
fi