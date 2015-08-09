#!/usr/bin/env bash
set -e

cd $SRC_DIR/tcl/win

if [ -f $LOG_DIR/tcl_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=x86_64-w64-mingw32 --enable-gcc \
              --prefix=$TCLTK_BUILD > $LOG_DIR/tcl_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/tcl_configure.marker

if [ -f $LOG_DIR/tcl_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make > $LOG_DIR/tcl_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/tcl_build.marker

if [ -f $LOG_DIR/tcl_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make install > $LOG_DIR/tcl_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/tcl_install.marker

cd $SRC_DIR/tk

if [ -f $LOG_DIR/tk_configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  ./configure --host=x86_64-w64-mingw32 --enable-gcc \
              --prefix=$TCLTK_BUILD --with-tcl=$SRC_DIR/tcl/win > $LOG_DIR/tk_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch $LOG_DIR/tk_configure.marker

if [ -f $LOG_DIR/tk_build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make > $LOG_DIR/tk_build.log 2>&1 || exit 1
  echo "--> Built"
fi
touch $LOG_DIR/tk_build.marker

if [ -f $LOG_DIR/tk_install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make install > $LOG_DIR/tk_install.log 2>&1 || exit 1
  echo "--> installed"
fi
touch $LOG_DIR/tk_install.marker

cd $SRC_DIR/..
