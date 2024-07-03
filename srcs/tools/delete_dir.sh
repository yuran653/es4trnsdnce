#!/bin/bash

set -a
level="../.."
source $level/.env
set +a

delete_directory() {
    if [ -d "$level/$1" ]; then
        rm -rf "$level/$1"
        echo "Deleted directory: $level/$1"
    fi
}

delete_directory "$wordpress_dir"
delete_directory "$mariadb_dir"
# delete_directory "$portainer_dir"
delete_directory "$data_dir"
