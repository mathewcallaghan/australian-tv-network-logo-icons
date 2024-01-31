#!/bin/bash
#
# Requires Inkscape 1.0+, pngqaunt.

set -ex

	# Remove existing directories and their contents
	rm -fr black/* white/* colour/* outline/* pdf/*

	# Create new directories
	mkdir -pv black white colour outline pdf/colour pdf/black pdf/white pdf/outline
	
	# Function to convert SVG files to PNG and move them to the specified directory
	svg_to_png() {
		local source_dir="$1"
		local destination_dir="$2"

		find "$source_dir" -type f -name '*.svg' -exec inkscape --export-type=png {} +
		mv "$source_dir"/*.png "$destination_dir"
	}

	# Function to convert SVG files to PDF and move them to the specified directory
	svg_to_pdf() {
		local source_dir="$1"
		local destination_dir="$2"

		find "$source_dir" -type f -name '*.svg' -exec inkscape --export-type=pdf {} +
		mv "$source_dir"/*.pdf "$destination_dir"
	}

	# Create White icons
	svg_to_png "./svg/white" "white"
	svg_to_pdf "./svg/white" "pdf/white"
	
	# Create Black icons
	svg_to_png "./svg/black" "black"
	svg_to_pdf "./svg/black" "pdf/black"

	# Create Colour icons
	svg_to_png "./svg/colour" "colour"
	svg_to_pdf "./svg/colour" "pdf/colour"
	
	# Create Outline icons
	svg_to_png "./svg/outline" "outline"
	svg_to_pdf "./svg/outline" "pdf/outline"
	
	# Check if pngquant is installed
	if ! command -v pngquant &> /dev/null; then
		echo "Error: pngquant is not installed. Please install it before running this script."
		exit 1
	fi

	# Compress PNG icons using pngquant.
	find ./ -type f -name '*.png' -exec pngquant --force --ext .png {} +

	## Create icon.csv ##
	
		# Specify the source directory path
		source_directory="svg/black"

		# Specify the output CSV file
		output_csv="icon.csv"

		# Specify the destination directory for the CSV file
		destination_directory="../../"

		# Navigate to the source directory
		cd "$source_directory" || exit

		# Create or overwrite the CSV file with a header
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

	# Move the CSV file to the destination directory
	mv "$output_csv" "$destination_directory"

exit
