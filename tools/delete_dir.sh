#!/bin/bash

source .env

delete_directory() {
    if [ -d "$1" ]; then
        rm -rf "$1"
        if [ ! $? -eq 0 ]; then
            exit 1
        fi
        echo "Deleted directory: $1"
    fi
}

delete_directory "$data_dir"
