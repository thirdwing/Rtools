# Rtools

## Goal

Generate a new toolchain using a modern version of the gcc compiler that is capable of building R, as well as all pre-existing R packages and other required libraries. It should be possible to re-generate the toolchain from source, preferably with a single command line invocation that downloads and builds all required components on the fly.

## Task lists

- [x] Scripts to build the new toolchain
- [ ] Ensure that R’s own tests (make check) pass
- [ ] Build and test ‘simple’ CRAN packages
- [ ] Rebuild external libraries for R on Windows
- [ ] Attempt to build a couple ‘key’ packages that depend on external libraries
- [ ] Build and test BioConductor packages
