#!/bin/bash

# Assumptions:
# 1. docker and docker-compose are installed
# 2. docker daemon is running

function stepper {
    echo "=============================="
    echo $1
    echo "=============================="
}
    
function check_rc {
    if [ $1 -ne 0 ]; then
        echo "Command failed for $2, rc=$1"
        exit 1
    fi
}

stepper "Building spring-boot app #1"
docker build -t pet-clinic-01 .
check_rc $? "Building container 1"

stepper "Building spring-boot app #2"
docker build -t pet-clinic-02 .
check_rc $? "Building container 2"

stepper "Spinning up docker-compose"

docker-compose down
docker-compose up -d
check_rc $? "docker-compose up"

stepper "Docker-compose status:"
docker-compose ps
