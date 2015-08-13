#!/usr/bin/env bash
set -e

cd $SRC_DIR/rtmpdump

if [ -f $LOG_DIR/rtmp_configure.marker ]
then
  echo "--> Already installed"
else
  echo "--> Configuring $BUILD_DIR"
  make CROSS_COMPILE=$HOST- SYS=mingw CFLAGS="-O2 -I$BUILD_DIR/include" LDFLAGS="-L$BUILD_DIR/lib" all
  make prefix=$BUILD_DIR CROSS_COMPILE=$HOST- SYS=mingw CFLAGS="-O2 -I$BUILD_DIR/include" LDFLAGS="-L$BUILD_DIR/lib" install
  echo "--> installed"
fi
touch $LOG_DIR/rtmp_configure.marker

cd ../..
