#!/bin/sh
# Requires ImageMagick

set -ex

mkdir -p black
mogrify -format png -background transparent svg/*.svg
mv svg/*.png black

mkdir -p white
mogrify -format png -background transparent -channel RGB -negate svg/*.svg
mv svg/*.png white

exit
