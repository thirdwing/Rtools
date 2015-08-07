#!/usr/bin/env bash
set -e

cd $SRC_DIR/libpng

if [ -f $LOG_DIR/libpng_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --enable-static --disable-shared \
  -prefix=$BUILD_DIR CFLAGS=-O2 CXXFLAGS=-O2 LIBS=-L$BUILD_DIR/lib \
  CPPFLAGS=-I$BUILD_DIR/include > $LOG_DIR/libpng_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/libpng_configure.marker

if [ -f $LOG_DIR/libpng_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/libpng_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/libpng_build.marker

if [ -f $LOG_DIR/libpng_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/libpng_install.log 2>&1 || exit 1
  echo "--> Installed"
fi
touch $LOG_DIR/libpng_install.marker

cd ../..
