#!/usr/bin/env bash
set -e

export GNU_URL="ftp://ftp.nluug.nl/mirror/gnu"

if [ -f $SRC_DIR/${MINGW_W64_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded mingw-w64"
else
    echo "--> Download mingw-w64 from sourceforge"
    wget http://ufpr.dl.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/${MINGW_W64_VERSION}.tar.bz2 -P $SRC_DIR
    cd $SRC_DIR
    tar jxf ${MINGW_W64_VERSION}.tar.bz2
fi

if [ -f $SRC_DIR/gcc-${GCC_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded gcc"
else
    echo "--> Download gcc from ftp://ftp.nluug.nl/mirror/gnu"
    wget ${GNU_URL}/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf gcc-${GCC_VERSION}.tar.bz2
fi

if [ -f $SRC_DIR/binutils-${BINUTILS_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded binutils"
else
    echo "--> Download binutils from ftp://ftp.nluug.nl/mirror/gnu"
    wget ${GNU_URL}/binutils/binutils-${BINUTILS_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf binutils-${BINUTILS_VERSION}.tar.bz2
fi

if [ -f $SRC_DIR/gmp-${GMP_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded gmp"
else
    echo "--> Download gmp from ftp://ftp.nluug.nl/mirror/gnu"
    wget ${GNU_URL}/gmp/gmp-${GMP_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf gmp-${GMP_VERSION}.tar.bz2
fi

if [ -f $SRC_DIR/mpfr-${MPFR_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded mpfr"
else
    echo "--> Download mpfr from ftp://ftp.nluug.nl/mirror/gnu"
    wget ${GNU_URL}/mpfr/mpfr-${MPFR_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf mpfr-${MPFR_VERSION}.tar.bz2
fi

if [ -f $SRC_DIR/mpc-${MPC_VERSION}.tar.gz ]
then
    echo "--> Already downloaded mpc"
else
    echo "--> Download mpc from ftp://gcc.gnu.org/pub/gcc/infrastructure"
    wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-${MPC_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar zxvf mpc-${MPC_VERSION}.tar.gz
fi