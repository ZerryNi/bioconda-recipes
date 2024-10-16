#!/bin/sh

if [[ ${target_platform} =~ osx.* ]]; then
	./configure --prefix=${PREFIX} CXXFLAGS="${CXXFLAGS} -Wno-error=unused-result -Wno-error=unknown-warning-option"
else
	./configure --prefix=${PREFIX} CXXFLAGS="${CXXFLAGS} -Wno-error=unused-result"
fi

sed -i '/const edge_property_type& ep = get(edge_bundle, g, e);/c \ const edge_property_type ep = get(edge_bundle, g, e);' $SRC_DIR/Graph/DotIO.h

make install 

mkdir -p ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/Examples
mkdir -p ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/src
mkdir -p ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/bin
cp Examples/arcs-make ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/Examples
cp src/long-to-linked-pe ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/src
cp Examples/makeTSVfile.py ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/Examples
cp bin/* ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/bin

echo "#!/bin/bash" > ${PREFIX}/bin/arcs-make
echo "make -f $(command -v ${PREFIX}/bin/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/bin/arcs-make) \$@" >> ${PREFIX}/bin/arcs-make
