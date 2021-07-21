#!/bin/sh
#
# Requires Inkscape 1.0+, pngqaunt.

set -ex

rm -fr black/* white/* colour/* pdf/*
mkdir -pv black white colour pdf/colour pdf/black pdf/white

# White
find ./svg/white -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/white/*.png white

find ./svg/white -type f -name '*.svg' -exec inkscape --export-type=pdf {} +

mv svg/white/*.pdf pdf/white

# Black
find ./svg/black -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/black/*.png black

find ./svg/black -type f -name '*.svg' -exec inkscape --export-type=pdf {} +

mv svg/black/*.pdf pdf/black

# Colour

find ./svg/colour -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/colour/*.png colour

find ./svg/colour -type f -name '*.svg' -exec inkscape --export-type=pdf {} +

mv svg/colour/*.pdf pdf/colour

# Compress png icons.
find ./ -type f -name '*.png' -exec pngquant --force --ext .png {} +

exit
