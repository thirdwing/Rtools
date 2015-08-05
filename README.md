# Rtools

## Goal

Generate a new toolchain using a modern version of the gcc compiler that is
capable of building R, as well as all pre-existing R packages and other
required libraries. It should be possible to re-generate the toolchain from
source, preferably with a single command line invocation that downloads and
builds all required components on the fly.

## Building the Toolchains

Assuming that you're running on a 64bit Linux that uses the `apt-get` package
manager, just run:

    ./install-dependencies.sh
    ./script_by_rubenvb/buildall.sh

This will produce MinGW compiler suites (both native and cross) that can then
be used to build R. It should be possible to then take an Rtools 3.3
installation, replace the pre-packages MinGW toolchains, and then use that to
build R-devel.

## Task lists

- [x] Scripts to build the new toolchain
- [x] Ensure that R’s own tests pass (We are using a workaround on `R_pow()` to pass `make check`.)
- [ ] Build and test ‘simple’ CRAN packages without `C/C++/Fortran`
- [ ] Rebuild external libraries for R on Windows
- [ ] Attempt to build a couple ‘key’ packages that depend on external libraries
- [ ] Build and test BioConductor packages
