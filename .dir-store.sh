#!/bin/bash

USER=$(whoami)
DIR=$(find /home/$USER -type d -name 'celestia-setup' | head -n 1)

case $1 in

    homedir)
        echo 'home/'$USER
    ;;

    temp)
        echo $DIR'/temp'
    ;;

    dir)
        echo $DIR
    ;;

    build)
        echo $DIR'/build-files'
    ;;
esac