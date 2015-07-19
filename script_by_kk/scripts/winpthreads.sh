#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    sh $MINGW_W64_SRC/mingw-w64-libraries/winpthreads/configure --host=$TARGET --build=$BUILD \
                                                             --prefix=$PREFIX/$TARGET \
                                                             --disable-shared --enable-static \
                                                             CFLAGS="-I${BUILD_DIR}/mingw64/include $HOST_CFLAGS" \
                                                             RCFLAGS="-I${BUILD_DIR}/mingw64/include $RCFLAGS" \
                                                             LDFLAGS="$HOST_LDFLAGS" \
                                                             > $LOG_DIR/winpthreads_configure.log 2>&1 || exit 1
fi
touch configure.marker

if [ -f build.marker ]
then
    echo "--> Already built"
else
    echo "--> Building"
    make $MAKE_OPTS > $LOG_DIR/winpthreads_build.log 2>&1 || exit 1
fi
touch build.marker

if [ -f install.marker ]
then
    echo "--> Already installed"
else
    echo "--> Installing"
    make $MAKE_OPTS install > $LOG_DIR/winpthreads_install.log 2>&1 || exit 1
    # mimic GCC runtime library behavior
    if [ "$HOST" == "x86_64-w64-mingw32" ] || [ "$HOST" == "i686-w64-mingw32" ]
    then
        mv $BUILD_DIR/winpthreads/libpthread.a $PREFIX/lib/libpthread.a
    else
        mv $BUILD_DIR/winpthreads/libpthread.a $PREFIX/$TARGET/lib/libpthread.a
    fi
fi
touch install.marker
