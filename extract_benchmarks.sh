#!/usr/bin/env bash

# Specify the directory containing the .tar.gz files
input_directory="benchmarks"

# Create a directory to store the extracted contents
output_directory=$(pwd)

# Change to the input directory
cd "$input_directory"

# Loop through each .tar.gz file
for file in *.tar.gz.aa; do
    echo "extracting pack files: $file"
    # Create a directory for each file
    target=${file/.aa/}
    cat "$target".* > "$target"
done

for file in *.tar.gz; do
    echo "extracting single file: $file"
    # Create a directory for each file
    # Note, we remove the one layer of directory for multipacks
    # This way, we do not e.g. get `bool_comb/bool_comb` directory.
    # It is hack, but what the heck.
    if [ -f "$file.aa" ]; then
        output_subdirectory="$output_directory"
    else
        output_subdirectory="$output_directory/${file%.tar.gz}"
    fi
    mkdir -p "$output_subdirectory"

    # Extract the file into the corresponding directory
    tar -xf "$file" -C "$output_subdirectory"
done

echo "[!] extracting done"
