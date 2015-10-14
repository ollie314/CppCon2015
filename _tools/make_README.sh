#!/bin/bash -e

function add_index {
    echo >> README.md
    echo "## $1" >> README.md
    echo >> README.md
    _tools/build/mkindex "$1" >> README.md
}

if [ ! -e _tools ] ; then
    echo Run this from the CppCon2015 root.
    exit 1
fi

mkdir -p _tools/build
cd _tools/build && cmake -G Ninja .. && cd -
ninja -C _tools/build

cat _tools/readme_header.md > README.md
echo "# Index of Materials" >> README.md

add_index "Keynotes"
add_index "Presentations"
add_index "Tutorials"
add_index "Demos"
add_index "Lightning Talks and Lunch Sessions"
