#!/usr/bin/env bash
set -e

cd $SRC_DIR/cairo

if [ -f $LOG_DIR/cairo_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=$HOST -prefix=$CAIRO_BUILD \
              --enable-static --disable-shared \
              --enable-fc=no --enable-ft=no --enable-xlib=no --enable-gobject=no \
              CFLAGS="-O2 -I$BUILD_DIR/include" \
              LDFLAGS="-L$BUILD_DIR/lib" \
              > $LOG_DIR/cairo_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/cairo_configure.marker

if [ -f $LOG_DIR/cairo_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/cairo_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/cairo_build.marker

if [ -f $LOG_DIR/cairo_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/cairo_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/cairo_install.marker

cd ../..
