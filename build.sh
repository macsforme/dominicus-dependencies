#!/bin/sh

echo Setting environmental variables...
export MACOSX_DEPLOYMENT_TARGET=10.6
export CPPFLAGS=-I../../dependencies/include
export LDFLAGS=-L../../dependencies/lib

mkdir -p dependencies/include
mkdir -p dependencies/lib

echo Building SDL...
cd src/SDL-1.2.15
./configure --disable-shared --prefix=`pwd`/../../dependencies
make -j`sysctl -n hw.ncpu`
make install
cd ../../

echo building libPNG...
cd src/libpng-1.6.34
./configure --disable-shared --prefix=`pwd`/../../dependencies
make -j`sysctl -n hw.ncpu`
make install
cd ../../

echo building FreeType 2...
cd src/freetype-2.9
./configure --disable-shared --prefix=`pwd`/../../dependencies
make -j`sysctl -n hw.ncpu`
make install
cd ../../

echo Done.
exit
