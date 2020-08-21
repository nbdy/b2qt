#!/bin/bash

QT_VERSION="5.15.0"
MACHINE="raspberrypi4"
CID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

if [ ! -d output/ ]; then mkdir output; fi

if [ $# -eq 1 ]; then QT_VERSION="$1"; elif [ $# -eq 2 ]; then QT_VERSION="$1"; MACHINE="$2"; fi

docker build -t b2qt .
docker run -t b2qt --name "$CID" "$QT_VERSION" "$MACHINE"

SRC_IMAGE="/home/builder/$MACHINE/tmp/deploy/images/$MACHINE/b2qt-embedded-qt5-image-$MACHINE.img"

docker cp "$CID:$SRC_IMAGE" ./output/"$MACHINE".img