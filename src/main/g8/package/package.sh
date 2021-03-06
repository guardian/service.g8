#!/bin/bash

# Usage: package.sh VERSION PATH_TO_JAR

VERSION=\$1
PATH_TO_JAR=\$2

DIR=\$(cd "\$( dirname "\${BASH_SOURCE[0]}" )" && pwd)

fpm -s dir \
    -a all \
    --rpm-os linux \
    -t rpm \
    -n "$name;format="norm"$" \
    --description "Package for $stack$ $name$" \
    -v \$VERSION \
    -d aws-cli \
    -d java-1.8.0-openjdk \
    --before-install \$DIR/before-install.sh \
    --after-install \$DIR/after-install.sh \
    \$DIR/files/=/ \
    \$PATH_TO_JAR=/opt/$organisation;format="packaged"$/$name;format="norm"$.jar
