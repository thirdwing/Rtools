#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  sh $SRC_DIR/gdb/configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX \
                            --with-libexpat-prefix=$PREREQ_INSTALL --disable-nls \
                            --with-python --disable-multilib --enable-64-bit-bfd \
                            $GNU_WIN32_OPTIONS \
                            $RUBENVB_PACKAGE_OPTIONS \
                            CFLAGS="$HOST_CFLAGS $GDB_PYTHON_WIN64_WORKAROUND -I$BUILD_DIR/python/include" LDFLAGS="$HOST_LDFLAGS -static -L$BUILD_DIR/python" \
                            > $LOG_DIR/gdb_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/gdb_build.log 2>&1 || exit 1
fi
touch build.marker

if [ -f install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/gdb_install.log 2>&1 || 
exit 1
fi
touch install.marker
