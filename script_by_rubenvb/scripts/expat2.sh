#!/usr/bin/env bash
set -e

cd $SRC_DIR/expat

if [ -f $LOG_DIR/expat_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --prefix=$BUILD_DIR \
              --disable-shared --enable-static \
              CFLAGS=-O2 > $LOG_DIR/expat_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/expat_configure.marker

if [ -f $LOG_DIR/expat_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/expat_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/expat_build.marker

if [ -f $LOG_DIR/expat_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/expat_install.log 2>&1 || exit 1
  echo "--> Installed"
fi
touch $LOG_DIR/expat_install.marker

cd ../..
