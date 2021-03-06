#!/bin/sh

echo "Will require sudo"
sudo echo 

if test ! $(which brew); then
    echo "Installing homebrew"
    TRAVIS=1 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# to build ALICE software 

# gcc is to get gfortran only (as we're using Mac OS X provided clang
# as our main compiler for c,c++ ...)

for pkg in \
    gcc \
	cmake \
	libtool \
    libpng \
    nanomsg \
    zeromq \
    protobuf \
    gettext \
    modules \
	; do
  brew install "$pkg"
done


