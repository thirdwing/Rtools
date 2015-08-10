#!/usr/bin/env bash
set -e

cd $SRC_DIR/pixman

if [ -f $LOG_DIR/pixman_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST -prefix=$BUILD_DIR \
              --enable-static --disable-shared \
              > $LOG_DIR/pixman_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/pixman_configure.marker

if [ -f $LOG_DIR/pixman_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/pixman_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/pixman_build.marker

if [ -f $LOG_DIR/pixman_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/pixman_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/pixman_install.marker

cd ../..
