#!/bin/bash

#--target-location option
TARGET_LOCATION=''

#Options handling
while [[ "$#" -gt 0 ]]; do
    case "$1" in 
        --target-location)
        TARGET_LOCATION="$2"

        if [[ ! -d "$TARGET_LOCATION" ]]; then
            echo "Specified target location was not found: $TARGET_LOCATION"
            exit 1
        fi

        shift 2
        ;;
        *)
        echo "Unknown option. Use -help to see available options"
        exit
        ;;
    esac
done      

#target location verification
if [[ -z "$TARGET_LOCATION" ]]; then
    default_target_location="$HOME/target_$(date +%s)"
    mkdir "$default_target_location"

    if [[ ! -d "$default_target_location" ]]; then
        echo "Cannot create directory: $default_target_location. Check access privilages"
        exit 1
    fi

    TARGET_LOCATION="$default_target_location"
    echo "Set default target location: $TARGET_LOCATION"
fi
