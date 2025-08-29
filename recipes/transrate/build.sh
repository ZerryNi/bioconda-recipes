#!/bin/bash
set -x
export CFLAGS="-I${PREFIX}/include"  # 确保头文件可找到
export LDFLAGS="-L${PREFIX}/lib -lcrypt"

mkdir -p ${PREFIX}/bin
gem build transrate.gemspec
gem install -n ${PREFIX}/bin transrate

# Don't vendor deps like salmon and blast
#ruby ${PREFIX}/bin/transrate --install-deps all

# Clean up the build a bit
rm -f ${PREFIX}/lib/ruby/gems/*/gems/transrate-*/ext/transrate/transrate.o
