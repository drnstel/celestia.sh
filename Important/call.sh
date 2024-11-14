#!/bin/bash
USER=$(whoami)
MAIN_DIR=$(find /home/$USER -type d -name 'Scripts' | head -n 1)
)

case $1 in

	packages)
		exec $MAIN_DIR/Packages.sh
	;;

	network)
		exec $MAIN_DIR/Net_Prep.sh
	;;

	wallpaper)
		exec $MAIN_DIR/WallpaperPlus.sh
	;;

	usb)
		exec $MAIN_DIR/Usb.sh
	;;

	bar)
		exec $MAIN_DIR/Bar.sh
	;;

	terminal)

		case $2 in

			kitty)
				exec $MAIN_DIR/Terminal.sh kitty
			;;

			foot)
				exec $MAIN_DIR/Terminal.sh foot
			;;
		esac
	;;
esac
