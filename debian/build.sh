#!/bin/sh

set -e

name="zig"
version="0.14.1"
ext="tar.xz"
url="https://ziglang.org/download/$version/$name-x86_64-linux-$version.$ext"
pub_key="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"
script_path="$(cd "$(dirname "$0")/.." && pwd)"
orig_name="${name}_$version.orig.$ext"

# clean
rm -rf "$script_path/doc/" "$script_path/lib/" "$script_path/LICENSE" "$script_path/README.md" "$script_path/zig"

# download binary package
cd "$script_path/.."
if [ ! -e "$orig_name" ]; then
    curl -fL "$url" -o "$orig_name"
fi

curl -fL "$url.minisig" -o "$orig_name.minisig"
minisign -V -P "$pub_key" -m "$orig_name"
rm -f "$orig_name.minisig"

tar xf "$orig_name" -C "$script_path" --strip-components=1
cd "$script_path"

# build
debuild -us -uc
