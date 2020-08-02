#!/bin/bash

QT_VERSION="5.15.0"
MACHINE="raspberrypi4"

if [ $# -eq 1 ]; then QT_VERSION="$1"; elif [ $# -eq 2 ]; then QT_VERSION="$1"; MACHINE="$2"; fi

docker build -t b2qt .
docker run -d -t b2qt -v "build/:/home/builder/build" "$QT_VERSION" "$MACHINE"