#!/bin/bash


make -j4
mkdir -p $PREFIX/bin
cp dashing2-64 dashing
cp -r dashing dashing2 dashing2-64 dashing2-tmp $PREFIX/bin
chmod +x $PREFIX/bin/{dashing,dashing2,dashing2-64,dashing2-tmp}
cd $PREFIX/bin
