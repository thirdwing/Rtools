#!/usr/bin/env bash
set -e

cd $SRC_DIR/openssl

if [ -f $LOG_DIR/openssl_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  CROSS_COMPILE=$HOST- ./Configure mingw64 no-asm -prefix=$BUILD_DIR \
                        > $LOG_DIR/openssl_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/openssl_configure.marker

if [ -f $LOG_DIR/openssl_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/openssl_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/openssl_build.marker

if [ -f $LOG_DIR/openssl_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/openssl_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/openssl_install.marker

cd ../..
