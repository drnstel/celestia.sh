#!/bin/bash

case $1 in
    directory)
    cat /home/rena/celestia-setup/build-files/done-text-call/test-done | head -n 1
    sleep 1
    cat /home/rena/celestia-setup/build-files/done-text-call/test-done | awk '{printf "%s", $0} END {print ""}'
    ;;
esac