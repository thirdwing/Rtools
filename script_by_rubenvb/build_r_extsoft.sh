#!/usr/bin/env bash
set -e

echo "-> zlib"
. ./scripts/zlib.sh || exit 1

echo "-> bzip2"
. ./scripts/bzip2.sh || exit 1

echo "-> expat"
. ./scripts/expat2.sh || exit 1

echo "-> gmp"
. ./scripts/gmp2.sh || exit 1

echo "-> gdal"
. ./scripts/gdal.sh || exit 1

echo "-> libpng"
. ./scripts/libpng.sh || exit 1

echo "-> libiconv"
. ./scripts/libiconv2.sh || exit 1

echo "-> libxml2"
. ./scripts/libxml2.sh || exit 1

echo "-> mpfr"
. ./scripts/mpfr2.sh || exit 1

echo "-> netcdf"
. ./scripts/netcdf.sh || exit 1

echo "-> pcre"
. ./scripts/pcre.sh || exit 1

echo "-> proj"
. ./scripts/proj.sh || exit 1

echo "-> tiff"
. ./scripts/tiff.sh || exit 1

echo "-> jpeg"
. ./scripts/jpeg.sh || exit 1

echo "-> xz"
. ./scripts/xz.sh || exit 1
