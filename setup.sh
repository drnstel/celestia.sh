#!/bin/bash

echo "Hold on, currently getting your terminal size!"
echo "(please do NOT resize this terminal as this will screw up the setup script.)"

USER=$(whoami)
SCRIPT_DIR=$(find /home/$USER -type f -name '.dir-store.sh' | head -n 1)
TEMP_DIR=$(exec $SCRIPT_DIR temp)
MAIN_DIR=$(exec $SCRIPT_DIR dir)

if [ -s $TEMP_DIR/monitor-res ]; then
    true
else
    stty size | xargs | cut -d ' ' -f 1 >> $TEMP_DIR/monitor-res 
    stty size | xargs | cut -d ' ' -f 2 >> $TEMP_DIR/monitor-res
fi

RES=$(python $MAIN_DIR/display.py)

whiptail --title "Celestia" --msgbox "Welcome to celestia!\nThis is the setup script for celestia, a startup script manager.\nThis package includes scripts for\nWallpaper\nNetwork\nAGS Bar\nFeh\nTerminal\nUSB\nPackages (upgrading)\n\nThe next prompt will be for deciding what you want to enable. When ready, please press <ENTER>" $RES

DIACMD=(whiptail --title "Celestia Startup Script Decider" --separate-output --checklist "Choose what you want from the list! (Press space on the selection to turn on what you want.)" $RES 8)
DIAOPT=(
    "Wallpaper" "This configures a script for your wallpaper! Includes: swww-daemon" ON
    "Network" "This configures a script for your network manager. Includes: nmcli" OFF
    "AGS Bar" "This configures a script for an AGS Bar. But isn't needed. Includes: AGS" OFF
    "Feh" "This configures a script for Feh. An image displayer. Includes: Feh" OFF
    "Terminal" "This configures a script to startup a terminal. Includes: None" OFF
    "USB" "This configures a script to mount a USB. Includes: None" OFF
    "Packages" "This configures a script for auto-updates. Includes: None" OFF
    "Repair" "Break your celestia? No worries! Just check everything else off and this on." OFF
)

DIACH=$("${DIACMD[@]}" "${DIAOPT[@]}" 2>&1 >/dev/tty)
clear

echo "Making .config/celestia..."
if [ $(ls /home/$USER/.config | grep "celestia" >>/dev/null; echo $?) -eq 0 ]; then
    true
else
    mkdir /home/$USER/.config/celestia
fi

for DIACH in $DIACH; do
    case $DIACH in
        Wallpaper)
            
        ;;

    esac
done

if [[ "$DIACH"=="" ]]; then
    exit 1
fi