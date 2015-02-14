#!/bin/bash

set -e;

read -p "This will create a new certificate and overwrite the old one, are you sure y/n? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mkdir -p ~/nginx-reverse-proxy/certs
    /usr/bin/openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/nginx-reverse-proxy/certs/nginx.key -out ~/nginx-reverse-proxy/certs/nginx.crt
fi