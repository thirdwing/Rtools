#!/usr/bin/env bash
set -e

cd $SRC_DIR/gmp

if [ -f $LOG_DIR/gmp_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --prefix=$BUILD_DIR \
              --disable-shared --enable-static --enable-cxx \
              CC=$HOST-gcc CXX=$HOST-g++ CFLAGS=-O2 LDFLAGS="$HOST_LDFLAGS" \
              > $LOG_DIR/gmp_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/gmp_configure.marker

if [ -f $LOG_DIR/gmp_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/gmp_build.log 2>&1 || exit 1
fi
touch $LOG_DIR/gmp_build.marker

if [ -f $LOG_DIR/gmp_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/gmp_install.log 2>&1 || exit 1
fi
touch $LOG_DIR/gmp_install.marker
