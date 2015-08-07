#!/usr/bin/env bash
set -e

cd $SRC_DIR/bzip2

if [ -f $LOG_DIR/bzip2_build.marker ]
then
  echo "--> Already configured"
else
  echo "--> Building and installing"
  make CC=$HOST-gcc AR=$HOST-ar RANLIB=$HOST-ranlib CFLAGS=-O2 libbz2.a
  touch bzip2 bzip2recover
  make CC=$HOST-gcc AR=$HOST-ar RANLIB=$HOST-ranlib CFLAGS=-O2 install PREFIX=$BUILD_DIR
  echo "--> Installed"
fi
touch $LOG_DIR/bzip2_build.marker

cd ../..
