#!/usr/bin/env bash
set -e

echo "Building linux 64-bit to Windows 32-bit cross-compiler"
sh ./buildlinux64mingw32.sh || exit 1
echo "Building linux 64-bit to Windows 64-bit cross-compiler"
sh ./buildlinux64mingw64.sh || exit 1

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
