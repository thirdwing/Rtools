#!/usr/bin/env bash
set -e
mkdir -p build_icu_linux
cd build_icu_linux

if [ -f $LOG_DIR/icu_linux_configure.marker ]
then
  echo "--> Already configured Linux ICU"
else
  echo "--> Configuring Linux ICU"
  sh $SRC_DIR/icu/source/runConfigureICU Linux --prefix=$ICU_BUILD  \
              --enable-static --disable-shared \
              --enable-release --disable-rpath \
              > $LOG_DIR/icu_linux_configure.log 2>&1 || exit 1
  echo "--> Configured Linux ICU"
fi
touch $LOG_DIR/icu_linux_configure.marker

if [ -f $LOG_DIR/icu_linux_build.marker ]
then
  echo "--> Already built Linux ICU"
else
  echo "--> Building Linux ICU"
  make $MAKE_OPTS > $LOG_DIR/icu_linux_build.log 2>&1 || exit 1
  echo "--> Built Linux ICU"
fi
touch $LOG_DIR/icu_linux_build.marker

if [ -f $LOG_DIR/icu_linux_install.marker ]
then
  echo "--> Already installed Linux ICU"
else
  echo "--> Installing Linux ICU"
  make $MAKE_OPTS install > $LOG_DIR/icu_linux_install.log 2>&1 || exit 1
  echo "--> installed Linux ICU"
fi
touch $LOG_DIR/icu_linux_install.marker

cd ..
mkdir -p build_icu_win
cd build_icu_win

if [ -f $LOG_DIR/icu_win_configure.marker ]
then
  echo "--> Already configured Windows ICU"
else
  echo "--> Configuring Windows ICU"
  sh $SRC_DIR/icu/source/configure --host=$HOST --with-cross-build=$ICU_BUILD/../build_icu_linux \
              --prefix=$ICU_BUILD --enable-static --disable-shared \
              --enable-release --disable-rpath \
              > $LOG_DIR/icu_win_configure.log 2>&1 || exit 1
  echo "--> Configured Windows ICU"
fi
touch $LOG_DIR/icu_win_configure.marker

if [ -f $LOG_DIR/icu_win_build.marker ]
then
  echo "--> Already built Windows ICU"
else
  echo "--> Building Windows ICU"
  make $MAKE_OPTS > $LOG_DIR/icu_win_build.log 2>&1 || exit 1
  echo "--> Built Windows ICU"
fi
touch $LOG_DIR/icu_win_build.marker

if [ -f $LOG_DIR/icu_win_install.marker ]
then
  echo "--> Already installed Windows ICU"
else
  echo "--> Installing Windows ICU"
  make $MAKE_OPTS install > $LOG_DIR/icu_win_install.log 2>&1 || exit 1
  echo "--> installed Windows ICU"
fi
touch $LOG_DIR/icu_win_install.marker

cd ..
