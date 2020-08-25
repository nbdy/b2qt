#!/bin/bash

QT_VERSION="5.15.0"
MACHINE="raspberrypi4"

if [ ! -d output/ ]; then mkdir output; fi

if [ $# -eq 1 ]; then QT_VERSION="$1"; elif [ $# -eq 2 ]; then QT_VERSION="$1"; MACHINE="$2"; fi

docker build -t b2qt .
docker run -t b2qt "$QT_VERSION" "$MACHINE"
CID=$(docker container list -a -n 1 --format "{{.ID}}" -f "ancestor=b2qt")
SRC_DIR="/home/builder/$MACHINE/tmp/deploy/images/$MACHINE/"
docker cp "$CID:$SRC_DIR" ./output/"$MACHINE".img