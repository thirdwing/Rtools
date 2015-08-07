#!/usr/bin/env bash
set -e

cd $SRC_DIR/zlib

if [ -f $LOG_DIR/zlib_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  env CROSS_PREFIX=$CROSS ./configure --static -prefix=$BUILD_DIR \
                                       > $LOG_DIR/zlib_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/zlib_configure.marker

if [ -f $LOG_DIR/zlib_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/zlib_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/zlib_build.marker

if [ -f $LOG_DIR/zlib_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/zlib_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/zlib_install.marker

cd ../..
