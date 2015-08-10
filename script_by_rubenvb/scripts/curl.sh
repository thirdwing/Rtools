#!/usr/bin/env bash
set -e

cd $SRC_DIR/curl

if [ -f $LOG_DIR/curl_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST -prefix=$CURL_BUILD \
              --enable-static --disable-shared \
              --without-random --enable-sspi --enable-ipv6 \
              > $LOG_DIR/curl_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/curl_configure.marker

if [ -f $LOG_DIR/curl_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/curl_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/curl_build.marker

if [ -f $LOG_DIR/curl_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/curl_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/curl_install.marker

cd ../..
