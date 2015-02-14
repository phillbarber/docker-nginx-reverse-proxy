#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ "$#" -ne 1 ]
then
  echo "Sorry, you have not supplied a docker container to proxy."
  echo "Usage: ./runDockerImage.sh [name-of-docker-container-you-are-proxying]"
  exit 1
fi

USER_NAME="phillbarber"
SHORT_NAME=nginx-reverse-proxy

FULL_IMAGE_NAME="$USER_NAME/$SHORT_NAME";

echo "Running Image: " $FULL_IMAGE_NAME

docker run --name "$SHORT_NAME" -d -p 80:80 -p 443:443 -v ~/nginx-reverse-proxy/certs:/etc/nginx-reverse-proxy/certs --link $1:proxied-service-link $FULL_IMAGE_NAME
