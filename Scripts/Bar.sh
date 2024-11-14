#!/bin/bash

USER=$(whoami)
IMG_DIR=$(find /home/$USER -type d -name 'Images' | head -n 1)

ags &
sleep 5
feh $IMG_DIR/*
