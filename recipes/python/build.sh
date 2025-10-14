

./configure --prefix=$PREFIX  CFLAGS="-Wno-implicit-function-declaration" --with-ensurepip=yes

make -j
make -j install
