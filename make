#!/bin/sh
# Requires ImageMagick, pngqaunt

set -ex

mkdir -p black
mogrify -format png -background transparent svg/*.svg
mv svg/*.png black

mkdir -p white
mogrify -format png -background transparent -channel RGB -negate svg/*.svg
mv svg/*.png white

pngquant --force --ext .png black/*.png
pngquant --force --ext .png white/*.png

exit
