#!/usr/bin/env bash
set -e

export GNU_URL="ftp://ftp.nluug.nl/mirror/gnu"

if [ -f $SRC_DIR/${MINGW_W64_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded mingw-w64"
else
    echo "--> Download mingw-w64"
    wget http://ufpr.dl.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/${MINGW_W64_VERSION}.tar.bz2 -P $SRC_DIR
    cd $SRC_DIR
    tar jxf ${MINGW_W64_VERSION}.tar.bz2
    ln -sf ${MINGW_W64_VERSION} mingw-w64
fi

if [ -f $SRC_DIR/gcc-${GCC_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded gcc"
else
    echo "--> Download gcc"
    wget ${GNU_URL}/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf gcc-${GCC_VERSION}.tar.bz2
    ln -sf gcc-${GCC_VERSION} gcc
fi

if [ -f $SRC_DIR/binutils-${BINUTILS_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded binutils"
else
    echo "--> Download binutils"
    wget ${GNU_URL}/binutils/binutils-${BINUTILS_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf binutils-${BINUTILS_VERSION}.tar.bz2
    ln -sf binutils-${BINUTILS_VERSION} binutils
fi

if [ -f $SRC_DIR/gmp-${GMP_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded gmp"
else
    echo "--> Download gmp"
    wget ${GNU_URL}/gmp/gmp-${GMP_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf gmp-${GMP_VERSION}.tar.bz2
    ln -sf gmp-${GMP_VERSION} gmp
fi

if [ -f $SRC_DIR/mpfr-${MPFR_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded mpfr"
else
    echo "--> Download mpfr"
    wget ${GNU_URL}/mpfr/mpfr-${MPFR_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf mpfr-${MPFR_VERSION}.tar.bz2
    ln -sf mpfr-${MPFR_VERSION} mpfr
fi

if [ -f $SRC_DIR/mpc-${MPC_VERSION}.tar.gz ]
then
    echo "--> Already downloaded mpc"
else
    echo "--> Download mpc"
    wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-${MPC_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar zxvf mpc-${MPC_VERSION}.tar.gz
    ln -sf mpc-${MPC_VERSION} mpc
fi

if [ -f $SRC_DIR/isl-${ISL_VERSION}.tar.bz2 ]
then
    echo "--> Already downloaded isl"
else
    echo "--> Download isl"
    wget ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-${ISL_VERSION}.tar.bz2 -P $SRC_DIR/
    cd $SRC_DIR
    tar jxf isl-${ISL_VERSION}.tar.bz2
    ln -sf isl-${ISL_VERSION} isl
fi


if [ -f $SRC_DIR/cloog-${CLOOG_VERSION}.tar.gz ]
then
    echo "--> Already downloaded cloog"
else
    echo "--> Download cloog"
    wget ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-${CLOOG_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar xzf cloog-${CLOOG_VERSION}.tar.gz
    ln -sf cloog-${CLOOG_VERSION} cloog
fi

if [ -f $SRC_DIR/expat-${EXPAT_VERSION}.tar.gz ]
then
    echo "--> Already downloaded expat"
else
    echo "--> Download expat"
    wget http://colocrossing.dl.sourceforge.net/project/expat/expat/${EXPAT_VERSION}/expat-${EXPAT_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar xzf expat-${EXPAT_VERSION}.tar.gz
    ln -sf expat-${EXPAT_VERSION} expat
fi

if [ -f $SRC_DIR/libiconv-${LIBICONV_VERSION}.tar.gz ]
then
    echo "--> Already downloaded libiconv"
else
    echo "--> Download expat from gnu"
    wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar xzf libiconv-${LIBICONV_VERSION}.tar.gz
    ln -sf libiconv-${LIBICONV_VERSION} libiconv
fi

if [ -f $SRC_DIR/gdb-${GDB_VERSION}.tar.gz ]
then
    echo "--> Already downloaded gdb"
else
    echo "--> Download gdb from gnu"
    wget http://ftp.gnu.org/pub/gnu/gdb/gdb-${GDB_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar xzf gdb-${GDB_VERSION}.tar.gz
    ln -sf gdb-${GDB_VERSION} gdb
fi

if [ -f $SRC_DIR/make-${MAKE_VERSION}.tar.gz ]
then
    echo "--> Already downloaded make"
else
    echo "--> Download make from gnu"
    wget http://ftp.gnu.org/pub/gnu/make/make-${MAKE_VERSION}.tar.gz -P $SRC_DIR/
    cd $SRC_DIR
    tar xzf make-${MAKE_VERSION}.tar.gz
    ln -sf make-${MAKE_VERSION} make
fi
