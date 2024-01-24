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

#Create icon.csv

# Specify the directory path
directory_path="svg/black"

# Specify the output CSV file
output_csv="icon.csv"

# Navigate to the directory
cd "$directory_path" || exit

# Create or overwrite the CSV file with header
echo "File Name" > "$output_csv"

# Loop through each file in the directory
for file in *; do
  # Check if it is a regular file (not a directory) and not the output CSV file
  if [ -f "$file" ] && [ "$file" != "$output_csv" ]; then
    # Extract the file name without extension
    file_name=$(basename "$file")
    file_name_no_ext="${file_name%.*}"
    
    # Append the entry to the CSV file
    echo "$file_name_no_ext" >> "$output_csv"
  fi
done

mv "$output_csv" ../../

exit
