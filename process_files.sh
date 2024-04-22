# (C) Project VIC International, 2024
# Released under Apache 2 License
#!/bin/bash

# Define the base directory where the files are located
base_directory="/home/clhall/yolov5-docker"  # Adjust this as needed

# Define the directory where found images and videos will be stored
destination_directory="images_for_labeling_April_2024"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_directory"

# Check if the file list exists
input_file="filelist.txt"
if [ ! -f "$input_file" ]; then
    echo "Error: File list '$input_file' not found."
    exit 1
fi

# Initialize a counter for the number of files found and copied
file_count=0

echo "Starting file search and copy from base directory: $base_directory"

# Read each filename from the list
while IFS= read -r file
do
  if [[ -z "$file" ]]; then
    echo "Warning: Empty filename read from list, skipping..."
    continue
  fi

  echo "Processing file: '$file' from list."
  
  # Use find to search for and copy each file to the destination directory
  find "$base_directory" -type f -iname "$file" -exec echo "Found file: {}" \; -exec cp "{}" "$destination_directory" \;

  if find "$base_directory" -type f -iname "$file" -exec false {} +; then
    echo "No files found for '$file'"
  else
    echo "Files copied for '$file'"
    ((file_count++))
  fi

done < "$input_file"

echo "Total files found and copied: $file_count"

# Go to the destination directory and remove duplicates
cd "$destination_directory"
fdupes -rdN .

echo "Image and video processing completed. Duplicates have been removed."
