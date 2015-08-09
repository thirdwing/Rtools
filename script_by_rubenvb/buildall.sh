#!/usr/bin/env bash
set -e

echo "Building linux 64-bit to Windows 32-bit cross-compiler"
sh ./buildlinux64mingw32.sh || exit 1
echo "Building linux 64-bit to Windows 64-bit cross-compiler"
sh ./buildlinux64mingw64.sh || exit 1

OLD_PATH=$PATH
export PATH=$PWD/linux64mingw32/mingw32/bin:$PWD/linux64mingw64/mingw64/bin:$PATH

echo "Building Windows 64-bit to Windows 64-bit native compiler"
sh ./buildmingw64mingw64.sh || exit 1
echo "Building Windows 32-bit to Windows 32-bit native compiler"
sh ./buildmingw32mingw32.sh || exit 1
echo "Building Windows 32-bit to Windows 64-bit native cross-compiler"
sh ./buildmingw32mingw64.sh || exit 1
echo "Building Windows 64-bit to Windows 32-bit native cross-compiler"
sh ./buildmingw64mingw32.sh || exit 1

##echo "Building linux 64-bit to Windows 32-bit dw2 cross-compiler"
##sh ./buildlinux64mingw32-dw2.sh

##export PATH=$PWD/linux64mingw32-dw2/mingw32-dw2/bin:$PATH

##echo "Building Windows 32-bit to Windows 32-bit dw2 native compiler"
##sh ./buildmingw32mingw32-dw2.sh || exit 1

export PATH=$PWD/linux64mingw64/mingw64/bin:$OLD_PATH
export SRC_DIR=$PWD/src

export WINLIB64=$PWD/W64soft
export WINLIB32=$PWD/W32soft
export TCLTK_BUILD=$PWD/tcltk
mkdir -p $TCLTK_BUILD

echo "64-bit libraries"

export HOST="x86_64-w64-mingw32"
export BUILD_DIR=$WINLIB64
export LOG_DIR=$BUILD_DIR/logs
mkdir -p $LOG_DIR

. ./build_r_extsoft.sh || exit 1

mkdir -p local320 local320/include local320/lib/x64
cp -rf W64soft/include/* ./local320/include
cp -rf W64soft/lib/* ./local320/lib/x64
rm -rf ./local320/lib/x64/*.la
rm -rf ./local320/lib/x64/*.dll.a

echo "Build tcltk"
. ./scripts/tcltk.sh || exit 1

## export PATH=$PWD/linux64mingw32/mingw32/bin:$PATH
