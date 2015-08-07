#!/usr/bin/env bash
set -e

export PATH=$PWD/linux64mingw64/mingw64/bin:$PATH

. ./scripts/directories.sh || exit 1

echo "64-bit libraries"

export HOST="x86_64-w64-mingw32"
export CROSS="x86_64-w64-mingw32-"
export BUILD_DIR=$WINLIB64
export LOG_DIR=$BUILD_DIR/logs
mkdir -p $LOG_DIR

echo "-> zlib"
. ./scripts/zlib.sh || exit 1

export PATH=$PWD/linux64mingw32/mingw32/bin:$PATH

echo "32-bit libraries"

export HOST="i686-w64-mingw32"
export CROSS="i686-w64-mingw32-"
export BUILD_DIR=$WINLIB32
export LOG_DIR=$BUILD_DIR/logs
mkdir -p $LOG_DIR

echo "-> zlib"
. ./scripts/zlib.sh || exit 1
