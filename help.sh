#!/bin/bash

if [[ "$1" = "-help" ]]; then
    echo "Options:"
    echo "--target-location                 Destination storage for downloaded dependencies"
    exit 1
fi
