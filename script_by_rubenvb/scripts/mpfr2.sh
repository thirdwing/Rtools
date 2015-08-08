#!/usr/bin/env bash
set -e

cd $SRC_DIR/mpfr

if [ -f $LOG_DIR/mpfr_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --enable-static --disable-shared \
  -prefix=$BUILD_DIR CFLAGS=-O2 CXXFLAGS=-O2 --with-gmp=$BUILD_DIR > $LOG_DIR/mpfr_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/mpfr_configure.marker

if [ -f $LOG_DIR/mpfr_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/mpfr_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/mpfr_build.marker

if [ -f $LOG_DIR/mpfr_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/mpfr_install.log 2>&1 || exit 1
  echo "--> Installed"
fi
touch $LOG_DIR/mpfr_install.marker

cd ../..
