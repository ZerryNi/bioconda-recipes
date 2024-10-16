#!/bin/bash
set -eu -o pipefail

cd $SRC_DIR
echo ${CXX}

mkdir ../yara-build
cd ../yara-build
cmake ../work -DSEQAN_BUILD_SYSTEM=APP:yara -DCMAKE_CXX_COMPILER=${CXX}

make all

mkdir -p $PREFIX/bin

binaries="\
yara_mapper \
yara_indexer \
"

cd bin

for i in $binaries
do
	cp $i $PREFIX/bin/$i
	chmod a+x $PREFIX/bin/$i
done

