#!/bin/bash

SCRIPT_DIR=$(find /home/$USER -type d -name 'done-text-call' | head -n 1)

case $1 in
    celestia)
    clear
    cat $SCRIPT_DIR/celestiadir | head -n 1
    sleep 1
    clear
    cat $SCRIPT_DIR/celestiadir | awk '{printf "%s", $0} END {print ""}'
    ;;
    
    dirstore)
    clear
    cat $SCRIPT_DIR/dirstore | head -n 1
    sleep 1
    clear
    cat $SCRIPT_DIR/celestiadir | awk '{printf "%s", $0} END {print ""}'
    ;;
esac