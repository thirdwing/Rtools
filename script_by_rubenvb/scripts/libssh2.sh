#!/usr/bin/env bash
set -e

cd $SRC_DIR/libssh2

if [ -f $LOG_DIR/libssh2_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST --enable-static --enable-shared \
              --prefix=$BUILD_DIR --with-openssl --with-libssl-prefix=$BUILD_DIR \
              --with-libgcrypt-prefix=$BUILD_DIR \
              --with-libz --with-libz-prefix=$BUILD_DIR CFLAGS=-O2 CXXFLAGS=-O2 LDFLAGS=-lgdi32 \
              > $LOG_DIR/libssh2_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/libssh2_configure.marker

if [ -f $LOG_DIR/libssh2_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/libssh2_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/libssh2_build.marker

if [ -f $LOG_DIR/libssh2_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/libssh2_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/libssh2_install.marker

cd ../..
