#!/bin/bash

basedir="$(cd $(dirname $0)/.. && pwd -P)"
target="$basedir/target"
version="$(git -C $basedir describe)"
name="snx-rs-$version-linux-x86_64"

rm -rf "$target/$name" 
mkdir "$target/$name"
cp "$target/x86_64-unknown-linux-gnu/release/snx-rs" "$target/$name/"
if [ "$?" != 0 ]; then
    exit 1
fi
cp "$basedir/assets/snx-rs.conf" "$basedir/assets/snx-rs.service" "$target/$name/"
cd "$target"
tar cJf "$name.tar.xz" "$name"
echo "$target/$name.tar.xz"