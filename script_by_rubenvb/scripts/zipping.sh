#!/usr/bin/env bash
set -e

case $HOST in
  "i686-w64-mingw32")
    PLATFORM_SUFFIX="win32"
    ;;
  "x86_64-w64-mingw32")
    PLATFORM_SUFFIX="win64"
    ;;
  "x86_64-linux-gnu")
    PLATFORM_SUFFIX="linux64"
    ;;
  "i686-linux-gnu")
    PLATFORM_SUFFIX="linux32"
    ;;
  "x86_64-apple-darwin11")
    PLATFORM_SUFFIX="mac64"
    ;;
  "i686-apple-darwin11")
    PLATFORM_SUFFIX="mac32"
    ;;
  "i686-pc-cygwin")
    PLATFORM_SUFFIX="cygwin"
    ;;
  *)
    echo "-> unknown host set: $HOST"
    ;;
esac

export XZ_OPT="-9"
SRC_COMPRESS="tar -Jhcf"
if [ "$HOST_OS" = "mingw32" ]
then
  BIN_COMPRESS="7za -l -bd -mx9 a"
  if [ "$SHORT_NAME" = "mingw32-dw2" ]
  then
    BIN_FILE=$PACKAGE_DIR/$HOST/$TARGET-gcc-dw2-${GCC_VERSION}-${PLATFORM_SUFFIX}.7z
  else
    BIN_FILE=$PACKAGE_DIR/$HOST/$TARGET-gcc-${GCC_VERSION}-${PLATFORM_SUFFIX}.7z
  fi
else
  BIN_COMPRESS=$SRC_COMPRESS
  if [ "$SHORT_NAME" = "mingw32-dw2" ]
  then
    BIN_FILE=$PACKAGE_DIR/$HOST/$TARGET-gcc-dw2-${GCC_VERSION}-${PLATFORM_SUFFIX}.tar.xz
  else
    BIN_FILE=$PACKAGE_DIR/$HOST/$TARGET-gcc-${GCC_VERSION}-${PLATFORM_SUFFIX}.tar.xz
  fi
fi

if [ -f $BIN_FILE ]
then
  echo "--> Binary file already exists"
else
  echo "--> Zipping binaries"
  cd $PREFIX/..
  $BIN_COMPRESS $BIN_FILE $SHORT_NAME > $LOG_DIR/zipping.log
fi

cd $TOP_DIR
