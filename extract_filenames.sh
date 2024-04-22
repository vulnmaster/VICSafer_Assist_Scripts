#!/bin/bash

# Define the input and output files
input_file="directory_listing.txt"
output_file="filelist.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Process the file
awk -F'/' '{print $NF}' "$input_file" > "$output_file"

echo "Filenames have been extracted to $output_file."
