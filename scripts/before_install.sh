#!/bin/bash

if [ "$(docker ps -aq -f name=swiggy-app)" ]; then
    docker stop swiggy-app || true
    docker rm swiggy-app || true
fi
