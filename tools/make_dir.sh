#!/bin/bash

source .env

create_directory() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        if [ ! $? -eq 0 ]; then
            exit 1
        fi
        echo "Directory created successfully: $1"
    fi
}

create_directory "$ssl_dir"
create_directory "$postgres_dir"

if [ ! -f "$ssl_dir/$crt_name" ] || [ ! -f "$ssl_dir/$key_name" ]; then
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
      -out "$ssl_dir/$crt_name" \
      -keyout "$ssl_dir/$key_name" \
      -subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=jgoldste/CN=42Bangkok.com"
    if [ ! -f "$ssl_dir/$crt_name" ] || [ ! -f "$ssl_dir/$key_name" ]; then
      echo "Error: Failed to create SSL certificate or key"
      exit 1
    fi
    echo "SSL certificate and key created successfully"
fi
