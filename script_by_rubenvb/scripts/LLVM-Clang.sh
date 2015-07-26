#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  sh $SRC_DIR/LLVM/configure --host=$HOST --build=$BUILD --with-sysroot=$PREFIX --prefix=$PREFIX \
                             --enable-optimized --disable-assertions --disable-pthreads \
                             CXX=$HOST-g++ CFLAGS="$HOST_CFLAGS" \
                             > $LOG_DIR/LLVM-Clang_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/LLVM-Clang_build.log 2>&1 || 
exit 1
fi
touch build.marker

if [ -f install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/LLVM-Clang_install.log 2>&1 || exit 1
fi
touch install.marker
