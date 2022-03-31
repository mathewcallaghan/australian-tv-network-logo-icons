#!/bin/sh
#
# Requires Inkscape 1.0+, pngqaunt.

set -ex

rm -fr black/* white/* colour/* outline/* pdf/*
mkdir -pv black white colour outline pdf/colour pdf/black pdf/white pdf/outline

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

# Outline
find ./svg/outline -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/outline/*.png outline

find ./svg/outline -type f -name '*.svg' -exec inkscape --export-type=pdf {} +

mv svg/outline/*.pdf pdf/outline

# Compress png icons.
find ./ -type f -name '*.png' -exec pngquant --force --ext .png {} +

exit
