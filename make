#!/bin/sh
# Requires Inkscape, pngqaunt.

set -ex

mkdir -pv black white

find ./svg/white -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/white/*.png white

find ./svg/black -type f -name '*.svg' -exec inkscape --export-type=png {} +

mv svg/black/*.png black

find ./ -type f -name '*.png' -exec pngquant --force --ext .png {} +

exit

