#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  sh $SRC_DIR/gcc/configure --host=$HOST --build=$BUILD --target=$TARGET --with-sysroot=$PREFIX --prefix=$PREFIX \
                            --with-gmp=$PREREQ_INSTALL --with-mpfr=$PREREQ_INSTALL --with-mpc=$PREREQ_INSTALL \
                            --with-cloog=$PREREQ_INSTALL --disable-cloog-version-check --with-isl=$PREREQ_INSTALL \
                            --enable-cloog-backend=isl --with-host-libstdcxx='-static -lstdc++ -lm' \
                            --enable-shared --enable-static --enable-threads=win32 \
                            --enable-plugins --disable-multilib \
                            --enable-languages=$GCC_LANGUAGES --enable-libgomp \
                            $EXTRA_OPTIONS --enable-fully-dynamic-string --enable-libstdcxx-time \
                            --disable-nls --disable-werror --enable-checking=release \
                            --with-gnu-as --with-gnu-ld \
                            $GNU_WIN32_OPTIONS \
                            $RUBENVB_PACKAGE_OPTIONS \
                            CC="$HOST_CC" CFLAGS="$HOST_CFLAGS" CXXFLAGS="$HOST_CXXFLAGS" LDFLAGS="$HOST_LDFLAGS" \
                            BOOT_CFLAGS="$HOST_CFLAGS" BOOT_CXXFLAGS="$HOST_CXXFLAGS" BOOT_LDFLAGS="$HOST_LDFLAGS" \
                            CFLAGS_FOR_TARGET="$TARGET_CFLAGS" CXXFLAGS_FOR_TARGET="$TARGET_CXXFLAGS" LDFLAGS_FOR_TARGET="$TARGET_LDFLAGS" \
                            > $LOG_DIR/gcc_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  #libada and libgomp need libgcc installed first to work
  make $MAKE_OPTS all-target-libgcc > $LOG_DIR/gcc-libgcc_build.log 2>&1 || exit 1
  make $MAKE_OPTS install-target-libgcc > $LOG_DIR/gcc-libgcc_install.log 2>&1 || exit 1
  make $MAKE_OPTS > $LOG_DIR/gcc_build.log 2>&1 || exit 1
fi
touch build.marker

if [ -f install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install-strip > $LOG_DIR/gcc_install.log 2>&1 || exit 1
fi
touch install.marker
