#!/bin/bash
set -ef -o pipefail

rm -rf bamtools
mkdir -p bamtools/include
ln -s $BUILD_PREFIX/lib bamtools/
ln -s $BUILD_PREFIX/include/bamtools/api bamtools/include/
ln -s $BUILD_PREFIX/include/bamtools/shared bamtools/include/

sed -i "43c \\\  find_package (ZLIB REQUIRED)" CMakeLists.txt
mkdir -p build
pushd build

mkdir -p $PREFIX/bin
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_STATIC_LIBRARY_PREFIX=$PREFIX -DCMAKE_CXX_COMPILER=${CXX} ${SRC_DIR} -DCMAKE_POLICY_VERSION_MINIMUM=3.5 
make
cp src/bam-read $PREFIX/bin/
popd
