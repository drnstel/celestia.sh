#!/bin/bash

SCRIPT_DIR=$(find /home/$USER -type d -name 'done-text-call' | head -n 1)

case $1 in
    celestia)
    clear
    cat /home/rena/celestia-setup/build-files/done-text-call/ | head -n 1
    sleep 1
    clear
    cat /home/rena/celestia-setup/build-files/done-text-call/test-done | awk '{printf "%s", $0} END {print ""}'
    ;;
esac