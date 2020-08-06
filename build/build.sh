#!/bin/bash

QT_VERSION="5.15.0"
MACHINE="raspberrypi4"

if [ $# -eq 0 ]; then
  echo "no arguments specified"
  echo "using v5.15.0"
  echo "and building for raspberrypi4"
elif [ $# -eq 1 ]; then
  QT_VERSION=$1
elif [ $# -eq 2 ]; then
  QT_VERSION=$1
  MACHINE=$2
fi

cd /home/builder/

git config --global color.ui false
git config --global user.email "somebody@notme.ok"
git config --global user.name "no"

repo init -u git://code.qt.io/yocto/boot2qt-manifest -m "v$QT_VERSION.xml"
repo sync
export MACHINE="$MACHINE"
source ./setup-environment.sh
bitbake b2qt-embedded-qt5-image

cp /home/builder/build-"$MACHINE"/tmp/deploy/images/"$MACHINE"/b2qt-embedded-qt5-image-"$MACHINE".img output/"$MACHINE".img