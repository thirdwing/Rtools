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
    patch mingw-w64/mingw-w64-crt/misc/mingw_getsp.S ../patches/mingw-w64-3.3.0.patch
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

if [ -f $SRC_DIR/bzip2-${BZIP2_VERSION}.tar.gz ]
then
    echo "--> Already downloaded bzip2"
else
    echo "--> Download bzip2"
    wget http://www.bzip.org/${BZIP2_VERSION}/bzip2-${BZIP2_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf bzip2-${BZIP2_VERSION}.tar.gz
    ln -sf bzip2-${BZIP2_VERSION} bzip2
fi

if [ -f $SRC_DIR/gdal-${GDAL_VERSION}.tar.gz ]
then
    echo "--> Already downloaded gdal"
else
    echo "--> Download gdal"
    wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf gdal-${GDAL_VERSION}.tar.gz
    ln -sf gdal-${GDAL_VERSION} gdal
fi

if [ -f $SRC_DIR/libpng-${PNG_VERSION}.tar.gz ]
then
    echo "--> Already downloaded libpng"
else
    echo "--> Download libpng"
    wget http://iweb.dl.sourceforge.net/project/libpng/libpng16/older-releases/${PNG_VERSION}/libpng-${PNG_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf libpng-${PNG_VERSION}.tar.gz
    ln -sf libpng-${PNG_VERSION} libpng
fi

if [ -f $SRC_DIR/libxml2-${XML2_VERSION}.tar.gz ]
then
    echo "--> Already downloaded libxml2"
else
    echo "--> Download libxml2"
    wget ftp://xmlsoft.org/libxml2/libxml2-${XML2_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf libxml2-${XML2_VERSION}.tar.gz
    ln -sf libxml2-${XML2_VERSION} libxml2
fi

if [ -f $SRC_DIR/netcdf-${NETCDF_VERSION}.tar.gz ]
then
    echo "--> Already downloaded netcdf"
else
    echo "--> Download netcdf"
    wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-${NETCDF_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf netcdf-${NETCDF_VERSION}.tar.gz
    ln -sf netcdf-${NETCDF_VERSION} netcdf
    patch netcdf/libsrc/posixio.c ../patches/netcdf.patch
fi

if [ -f $SRC_DIR/pcre-${PCRE_VERSION}.tar.gz ]
then
    echo "--> Already downloaded pcre"
else
    echo "--> Download pcre"
    wget http://iweb.dl.sourceforge.net/project/pcre/pcre/${PCRE_VERSION}/pcre-${PCRE_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf pcre-${PCRE_VERSION}.tar.gz
    ln -sf pcre-${PCRE_VERSION} pcre
fi

if [ -f $SRC_DIR/proj-${PROJ_VERSION}.tar.gz ]
then
    echo "--> Already downloaded proj"
else
    echo "--> Download proj"
    wget http://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf proj-${PROJ_VERSION}.tar.gz
    ln -sf proj-${PROJ_VERSION} proj
fi

if [ -f $SRC_DIR/tiff-${TIFF_VERSION}.tar.gz ]
then
    echo "--> Already downloaded tiff"
else
    echo "--> Download tiff"
    wget http://download.osgeo.org/libtiff/tiff-${TIFF_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf tiff-${TIFF_VERSION}.tar.gz
    ln -sf tiff-${TIFF_VERSION} tiff
fi

if [ -f $SRC_DIR/zlib-${ZLIB_VERSION}.tar.gz ]
then
    echo "--> Already downloaded zlib"
else
    echo "--> Download zlib from sourceforge"
    wget http://iweb.dl.sourceforge.net/project/libpng/zlib/${ZLIB_VERSION}/zlib-${ZLIB_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf zlib-${ZLIB_VERSION}.tar.gz
    ln -sf zlib-${ZLIB_VERSION} zlib
fi

if [ -f $SRC_DIR/xz-${XZ_VERSION}.tar.gz ]
then
    echo "--> Already downloaded xz"
else
    echo "--> Download xz"
    wget http://tukaani.org/xz/xz-${XZ_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf xz-${XZ_VERSION}.tar.gz
    ln -sf xz-${XZ_VERSION} xz
fi

if [ -f $SRC_DIR/gsl-${GSL_VERSION}.tar.gz ]
then
    echo "--> Already downloaded gsl"
else
    echo "--> Download gsl"
    wget http://ftp.gnu.org/gnu/gsl/gsl-${GSL_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf gsl-${GSL_VERSION}.tar.gz
    ln -sf gsl-${GSL_VERSION} gsl
fi

## http://www.ijg.org/files/jpegsrc.v9a.tar.gz

if [ -f $SRC_DIR/jpegsrc.v${JPEG_VERSION}.tar.gz ]
then
    echo "--> Already downloaded jpeg"
else
    echo "--> Download jpeg"
    wget http://www.ijg.org/files/jpegsrc.v${JPEG_VERSION}.tar.gz -P $SRC_DIR
    cd $SRC_DIR
    tar xzf jpegsrc.v${JPEG_VERSION}.tar.gz
    ln -sf jpeg-${JPEG_VERSION} jpeg
fi
