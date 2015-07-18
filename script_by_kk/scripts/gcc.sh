#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    sh $SRC_DIR/gcc-${GCC_VERSION}/configure --host=$HOST --build=$BUILD --target=$TARGET --with-sysroot=$PREFIX --prefix=$PREFIX \
                              --with-gmp=$PREREQ_INSTALL --with-mpfr=$PREREQ_INSTALL --with-mpc=$PREREQ_INSTALL \
                              --disable-shared --enable-static \
                              --enable-targets=all \
                              --enable-languages=$GCC_LANGUAGES --enable-libgomp \
                              --enable-sjlj-exceptions --enable-fully-dynamic-string \
                              --enable-threads=posix --disable-multilib \
                              --disable-nls --disable-werror --enable-checking=release \
                              $GNU_WIN32_OPTIONS \
                              CFLAGS="-I${BUILD_DIR}/mingw64/include $HOST_CFLAGS" \
                              LDFLAGS="$HOST_LDFLAGS" \
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
    make $MAKE_OPTS all-gcc > $LOG_DIR/gcc_build.log 2>&1 || exit 1
    ##make $MAKE_OPTS install-target-libgcc > $LOG_DIR/gcc-libgcc_install.log 2>&1 || exit 1
    ##make $MAKE_OPTS > $LOG_DIR/gcc_build.log 2>&1 || exit 1
fi
touch build.marker

if [ -f install.marker ]
then
    echo "--> Already installed"
else
    echo "--> Installing"
    make $MAKE_OPTS install-strip-gcc > $LOG_DIR/gcc_install.log 2>&1 || exit 1
fi
touch install.marker
