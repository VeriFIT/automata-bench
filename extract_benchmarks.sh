#!/bin/bash

# Specify the directory containing the .tgz files
input_directory="benchmarks"

# Create a directory to store the extracted contents
output_directory="."

# Change to the input directory
cd "$input_directory"

# Loop through each .tgz file
for file in *.tgz.aa; do
    echo "extracting pack files: $file"
    # Create a directory for each file
    output_subdirectory="$output_directory/${file%.tgz.aa}"
    mkdir -p "$output_subdirectory"
    target=${file/.aa/}
    cat "$target".* > "$target"
done

for file in *.tgz; do
    echo "extracting single file: $file"
    # Create a directory for each file
    output_subdirectory="$output_directory/${file%.tgz}"
    mkdir -p "$output_subdirectory"

    # Extract the file into the corresponding directory
    tar -xf "$file" -C "$output_subdirectory"
done

echo "[!] extracting done"
