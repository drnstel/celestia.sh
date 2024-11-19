#!/bin/bash

USER=$(whoami) # Grabs the user's name

echo "Locating directories... (This may take a bit.)"

# Locates the script
SCRIPT_DIR=$(find /home/$USER -type f -name '.dir-store.sh' | head -n 1)

# Locates the temp/ folder using the dir-store script
TEMP_DIR=$(exec $SCRIPT_DIR temp)

# Locates the celestia-setup/ folder using the dir-store script
MAIN_DIR=$(exec $SCRIPT_DIR dir)

echo "Done."; sleep 0.5; # clear

echo -e "Hold on, currently getting your terminal size!\n(please do NOT resize this terminal as this will screw up the setup script.)" 

if [ -s $TEMP_DIR/monitor-res ]; then 
    # Will do nothing if there is nothing in the monitor-res file
    true
else
    # Grabs the length of the terminal
    stty size | xargs | cut -d ' ' -f 1 >> $TEMP_DIR/monitor-res

    # Grabs the width of the terminal
    stty size | xargs | cut -d ' ' -f 2 >> $TEMP_DIR/monitor-res
fi

# Runs the python script just for making sure whiptail can understand the terminal res
RES=$(python $MAIN_DIR/display.py)

echo "Done."; sleep 0.5; # clear

# First dialog prompt
whiptail --title "Celestia" --msgbox "Welcome to celestia!\nThis is the setup script for celestia, a startup script manager.\nThis package includes scripts for\nWallpaper\nNetwork\nAGS Bar\nFeh\nTerminal\nUSB\nPackages (upgrading)\n\nThe next prompt will be for deciding what you want to enable. When ready, please press <ENTER>" $RES

# a cleaner version of writing the checklist dialog
DIACMD=(whiptail --title "Celestia" --separate-output --checklist "Choose what you want from the list! (Press space on the selection to turn on what you want.)" $RES 9)
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

# Runs the dialog prompt
DIACH=$("${DIACMD[@]}" "${DIAOPT[@]}" 2>&1 >/dev/tty)

#clear

# Checks if there is ANYTHING written in temp/DiaChosen
if [ -s $TEMP_DIR'/DiaChosen' ]; then
    # Do nothing
    true
else
    # Write the dialog selections into temp/DiaChosen
    echo $DIACH >> $TEMP_DIR'/DiaChosen'
fi

echo "Making .config/celestia..."

# Checks if the celestia directory already exists within the user's .config folder.
if [ $(ls /home/$USER/.config | grep "celestia" >>/dev/null; echo $?) -eq 0 ]; then
    # Do nothing
    true
else
    # Create the directory in the user's .config folder
    mkdir /home/$USER/.config/celestia
fi

echo "Creating the folders needed..."

# Checks if the following directories already exist within the celestia folder.
if [ $(ls /home/$USER/.config/celestia | grep "Important" >>/dev/null; echo $?) -eq 0 ]; then
    # Do nothing
    true
else
    # Creates the directory in the user's celestia folder
    sleep 1
    echo "Creating .Important/"
    mkdir /home/$USER/.config/celestia/Important
fi

if [ $(ls /home/$USER/.config/celestia | grep "Images" >>/dev/null; echo $?) -eq 0 ]; then
    # Do nothing
    true
else
    # Creates the directory in the user's celestia folder
    sleep 1
    echo "Creating .Images/"
    mkdir /home/$USER/.config/celestia/Images
fi

if [ $(ls /home/$USER/.config/celestia | grep "Scripts" >>/dev/null; echo $?) -eq 0 ]; then
    # Do nothing
    true
else
    # Creates the directory in the user's celestia folder
    sleep 1
    echo "Creating .Scripts/"
    mkdir /home/$USER/.config/celestia/Scripts
fi

if [ $(ls /home/$USER/.config/celestia | grep "Wallpapers" >>/dev/null; echo $?) -eq 0 ]; then
    # Do nothing
    true
else
    # Creates the directory in the user's celestia folder
    sleep 1
    echo "Creating .Wallpapers/"
    mkdir /home/$USER/.config/celestia/Wallpapers
fi

echo "All directories have been made."
sleep 1

OSCMD=$(whiptail --title "Celestia" --separate-output --menu "Select your operating system for the celestia setup to run smoothly. (If your OS is not listed, this means your flavour of linux has NOT been tested.)" $RES 3 "Arch Based OS (pacman/aur)" "Will use Arch repos and such for the rest of this install." "Debian/Ubuntu Based OS (apt)" "Will use Apt repos and such for the rest of this install." "Fedora Based OS (dnf)" "Will use dnf repos and such for the rest of this install. (UNTESTED)" 2>&1 >/dev/tty)

IS_DIACH_VERBOSE=$(grep "Verbose" $TEMP_DIR/dia-chosen >>/dev/null; echo $?)

if [[ $IS_DIACH_VERBOSE == "0" ]]; then

    source 'build-files/wp_prep.sh'
    source 'build-files/net_prep.sh'
    source 'build-files/done_call.sh'

    CHOICE=$(sed 's/Verbose[[:space:]]//g' $TEMP_DIR/dia-chosen)

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