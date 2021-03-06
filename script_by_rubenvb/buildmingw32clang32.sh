#!/usr/bin/env bash
set -e

# platform information
export HOST_ARCH=i686
export HOST_VENDOR=w64
export HOST_OS=mingw32
export HOST="$HOST_ARCH-$HOST_VENDOR-$HOST_OS"

export TARGET_ARCH=i686
export TARGET_VENDOR=w64
export TARGET_OS=mingw32
export TARGET="$TARGET_ARCH-$TARGET_VENDOR-$TARGET_OS"

export SHORT_NAME=mingw32-dw2
export LONG_NAME=mingw32clang32

# call main build script
. ./scripts/buildclangfromcross.sh
