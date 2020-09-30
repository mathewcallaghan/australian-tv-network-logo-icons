#!/bin/sh
# Requires Inkscape, pngqaunt, ImageMagick.

set -ex

DIR=$PWD

	mkdir -pv black
	cd svg

for FILE in *.svg; do

	inkscape --export-type=png "$FILE"

done

	mv *.png ../black
	cd ../black

for FILE in *.png; do

	pngquant --force --ext .png "$FILE"

done

	cd ${DIR}
	cp -r black white
	cd white

for FILE in *.png; do

	mogrify -format png -background transparent -channel RGB -negate "$FILE"
	pngquant --force --ext .png "$FILE"

done

exit

