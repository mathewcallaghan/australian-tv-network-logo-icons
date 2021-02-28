#!/bin/sh
#
# Requires Inkscape 1.0+, pngqaunt.

set -ex

rm -fr black/* white/* colour/*
mkdir -pv black white colour

# White
find ./svg/white -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/white/*.png white

#Black
find ./svg/black -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/black/*.png black

# Colour

find ./svg/colour -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/colour/*.png colour

# Compress
find ./ -type f -name '*.png' -exec pngquant --force --ext .png {} +

exit
