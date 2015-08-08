#!/usr/bin/env bash
set -e

cd $SRC_DIR/proj

if [ -f $LOG_DIR/proj_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --enable-static --disable-shared \
  -prefix=$BUILD_DIR CFLAGS=-O2 CXXFLAGS=-O2 --without-mutex > $LOG_DIR/proj_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/proj_configure.marker

if [ -f $LOG_DIR/proj_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/proj_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/proj_build.marker

if [ -f $LOG_DIR/proj_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/proj_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/proj_install.marker

cd ../..
