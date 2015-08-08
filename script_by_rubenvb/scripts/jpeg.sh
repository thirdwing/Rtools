#!/usr/bin/env bash
set -e

cd $SRC_DIR/jpeg

if [ -f $LOG_DIR/jpeg_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --prefix=$BUILD_DIR \
              --disable-shared --enable-static \
              CFLAGS=-O2 > $LOG_DIR/jpeg_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/jpeg_configure.marker

if [ -f $LOG_DIR/jpeg_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/jpeg_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/jpeg_build.marker

if [ -f $LOG_DIR/jpeg_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/jpeg_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/jpeg_install.marker

cd ../..
