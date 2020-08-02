#!/bin/bash

QT_VERSION="5.15.0"
MACHINE="raspberrypi4"

if [ $# -eq 1 ]; then QT_VERSION="$1"; elif [ $# -eq 2 ]; then QT_VERSION="$1"; MACHINE="$2"; fi

docker build -t b2qt .
docker run -t b2qt -v "$(pwd)/output/:/home/builder/output" "$QT_VERSION" "$MACHINE"