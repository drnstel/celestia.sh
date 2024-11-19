#!/bin/bash

wp_prep(){
    dir=$(find -type d -name '')

    verbose=$1

    case $1 in
        -v)
            set -x
        ;;
    esac

    pwd
    
    wget --no-check-certificate 'https://raw.githubusercontent.com/drnstel/celestia.sh/refs/heads/main/Scripts/Wallpaper.sh' -O $dir/
    
        
    set +x
}