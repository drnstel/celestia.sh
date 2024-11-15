#!/bin/bash

USER=$(whoami)
DIR=$(find -type d -name 'celestia-setup' /home/$USER | head -n 1)

case $1 in

    homedir)
        echo 'home/$USER'
    ;;
    temp)
        echo ''
esac