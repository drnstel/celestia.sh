#!/bin/bash

echo "Hold on, currently getting your terminal size!"
echo "(please do NOT resize this terminal as this will screw up the setup script.)"

USER=$(whoami)
SCRIPT_DIR=$(find /home/$USER -type f -name '.dir-store.sh' | head -n 1)
TEMP_DIR=$(exec $SCRIPT_DIR temp)
MAIN_DIR=$(pwd)

if [ -s $TEMP_DIR/monitor-res ]; then
    true
else
    stty size | xargs | cut -d ' ' -f 1 >> $TEMP_DIR/monitor-res 
    stty size | xargs | cut -d ' ' -f 2 >> $TEMP_DIR/monitor-res
fi

RES=$(python $MAIN_DIR/display.py)

whiptail --title "Celestia" --msgbox "Welcome to celestia!\nThis is the setup script for celestia, a startup script manager.\nThis package includes scripts for\nWallpaper\nNetwork\nAGS Bar\nFeh\nTerminal\nUSB\nPackages (upgrading)\n\nThe next prompt will be for deciding what you want to enable. When ready, please press <ENTER>" $RES

DIACMD=(whiptail --title "Celestia Startup Script Decider" --separate-output --checklist "Choose what you want from the list! (Press space on the selection to turn on what you want.)" $RES 9)
DIAOPT=(
    "Repair" "Break your celestia? No worries! Just check everything else off and this on." OFF
    "Verbose" "Want to see what celestia is doing? No problem! Feel free to check this.\n\n" OFF
    "Wallpaper" "This configures a script for your wallpaper! Includes: swww-daemon" ON
    "Network" "This configures a script for your network manager. Includes: nmcli" OFF
    "AGS Bar" "This configures a script for an AGS Bar. But isn't needed. Includes: AGS" OFF
    "Feh" "This configures a script for Feh. An image displayer. Includes: Feh" OFF
    "Terminal" "This configures a script to startup a terminal. Includes: None" OFF
    "USB" "This configures a script to mount a USB. Includes: None" OFF
    "Packages" "This configures a script for auto-updates. Includes: None" OFF
)

DIACH=$("${DIACMD[@]}" "${DIAOPT[@]}" 2>&1 >/dev/tty)
# clear
if [ -s $TEMP_DIR'/DiaChosen' ]; then
    true
else
    echo $DIACH >> DiaChosen
fi

IS_DIACH_VERBOSE=$(cut $TEMP_DIR/DiaChosen -d ' ' -f 1)

if [[ $IS_DIACH_VERBOSE == "Verbose" ]]; then
    source 'build-files/wp_prep.sh'
    source 'build-files/net_prep.sh'
    source 'build-files/done_call.sh'
    CHOICE=$(sed 's/Verbose[[:space:]]//g' $TEMP_DIR/DiaChosen)
    for CH in $CHOICE; do
        case $CH in
            Repair)
            ;;
            Wallpaper)
                echo "Building wallpaper files..."
                sleep 2
                # clear
                wp_prep -v
            ;;
            Network)
                echo "Creating Network Script..."
            ;;
            AGS)

            ;;
            Feh)

            ;;
            Terminal)

            ;;
            USB)

            ;;
            Packages)

            ;;
        esac
    done
else
    true
fi


echo "Making .config/celestia..."
# if [ $(ls /home/$USER/.config | grep "celestia" >>/dev/null; echo $?) -eq 0 ]; then
#     true
# else
#     mkdir /home/$USER/.config/celestia
# fi

# for DIACH in $DIACH; do
#     case $DIACH in
#         Verbose)
#         ;;
#         Wallpaper)
#             echo "Building wallpaper files..."
#             sleep 1
#             # clear
#             exec $BUILD_FILES/wp_prep.sh
#         ;;
#         Network)
#             echo "Creating Network Script..."
#         ;;
#         AGS)

#         ;;
#         Feh)

#         ;;
#         Terminal)

#         ;;
#         USB)

#         ;;
#         Packages)

#         ;;
#         Repair)
#         ;;
#     esac
# done

# if [[ "$DIACH"=="" ]]; then
#     exit 1
# fi