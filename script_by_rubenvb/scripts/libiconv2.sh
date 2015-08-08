#!/usr/bin/env bash
set -e

cd $SRC_DIR/libiconv

if [ -f $LOG_DIR/libiconv_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --prefix=$BUILD_DIR \
              --disable-shared --enable-static \
              CC=$HOST_CC-gcc CFLAGS=-O2 > $LOG_DIR/libiconv_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/libiconv_configure.marker

if [ -f $LOG_DIR/libiconv_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS $MAKE_AR > $LOG_DIR/libiconv_build.log 2>&1 || exit 1
fi
touch $LOG_DIR/libiconv_build.marker

if [ -f $LOG_DIR/libiconv_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS $MAKE_AR install > $LOG_DIR/libiconv_install.log 2>&1 || exit 1
fi
touch $LOG_DIR/libiconv_install.marker

cd ..
