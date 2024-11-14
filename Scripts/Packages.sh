#!/bin/bash

USER=$(whoami)
HOME_DIR=$(find /home/$USER -type d -name '.scripts' | head -n 1)

expect $HOME_DIR/.packages.exp
