#!/usr/bin/env bash
set -e

cd $SRC_DIR/xz

if [ -f $LOG_DIR/xz_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --prefix=$BUILD_DIR --enable-static --disable-shared \
  CFLAGS=-O2  CXXFLAGS=-O2 > $LOG_DIR/xz_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/xz_configure.marker

if [ -f $LOG_DIR/xz_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/xz_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/xz_build.marker

if [ -f $LOG_DIR/xz_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/xz_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/xz_install.marker

cd ../..
