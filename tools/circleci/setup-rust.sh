#!/bin/sh

set -e
set -u

RUST_HOME=$1
RUST_NIGHTLY_RELEASE_DATE=$2
VERSION="nightly-$RUST_NIGHTLY_RELEASE_DATE"

if [ -d $RUST_HOME ]; then
  echo "Using Rust version $VERSION at $RUST_HOME"
else
  echo "Installing Rust $VERSION to $RUST_HOME using rustup.sh"
  curl -sSf https://static.rust-lang.org/rustup.sh | \
      sh -s -- --prefix=$RUST_HOME --channel=nightly --$RUST_NIGHTLY_RELEASE_DATE --disable-sudo
fi
