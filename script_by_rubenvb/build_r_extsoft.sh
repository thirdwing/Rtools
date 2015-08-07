#!/usr/bin/env bash
set -e

export PATH=$PWD/linux64mingw64/mingw64/bin:$PATH

. ./scripts/directories.sh || exit 1

export BUILD_DIR=$WINLIB64
export LOG_DIR=$BUILD_DIR/logs

mkdir -p $LOG_DIR

echo $LOG_DIR

. ./scripts/zlib.sh || exit 1
