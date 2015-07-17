#!/usr/bin/env bash
set -e

# common settings
echo "Executing preliminary common steps"
export BUILD_CROSS_FROM_NATIVE="true"
. ./scripts/common.sh || exit 1

# Projects to be built, in the right order
PREGCC_STEPS="mingw-w64-headers binutils gmp mpfr mpc"
POSTGCC_STEPS="cleanup zipping"
cd $BUILD_DIR
mkdir -p $PREGCC_STEPS
mkdir -p mingw-w64-crt
mkdir -p winpthreads
#mkdir -p gcc-posix
mkdir -p $POSTGCC_STEPS
cd $TOP_DIR

# Build
MAKE_OPTS='-j8'
# prepare for GCC
for step in $PREGCC_STEPS
do
    echo "-> $step"
    cd $BUILD_DIR/$step
    . $SCRIPTS/$step.sh || exit 1
done