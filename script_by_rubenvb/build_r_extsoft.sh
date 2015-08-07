#!/usr/bin/env bash
set -e

echo "-> zlib"
. ./scripts/zlib.sh || exit 1

echo "-> bzip2"
. ./scripts/bzip2.sh || exit 1

