#!/bin/bash

set -a
level="../.."
source $level/.env
set +a

create_directory() {
    if [ ! -d "$level/$1" ]; then
        mkdir -p "$level/$1"
        if [ $? -eq 0 ]; then
            echo "Directory created successfully: $level/$1"
        else
            echo "Directory creation failed: $level/$1"
        fi
    fi
    echo $level/$1
}

create_directory "$wordpress_dir"
create_directory "$mariadb_dir"
# create_directory "$portainer_dir"
