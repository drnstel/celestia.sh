#!/bin/bash

USER=$(whoami)
MAIN_DIR=$(find /home/$USER -type d -name 'celestia' | head -n 1)

expect $MAIN_DIR/Scripts/.update/.packages.exp
