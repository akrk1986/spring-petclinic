#!/bin/bash

LATEST=1.18.0

echo "Install docker-compose version ${LATEST}"

curl -L https://github.com/docker/compose/releases/download/${LATEST}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
