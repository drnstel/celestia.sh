#!/bin/bash

wp_prep(){
    verbose=$1

    case $1 in
        -v)
            set -x
        ;;
    esac

    pwd
    sleep 1
    set +x
}