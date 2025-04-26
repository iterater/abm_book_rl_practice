#!/bin/bash

# Path replacement script for source files

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <old_path> <new_path>"
    echo "Example: $0 /project/src /old/path /new/path"
    exit 1
fi

directory="$1"
old_path="$2"
new_path="$3"

# Validate directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory $directory does not exist"
    exit 1
fi

# File extensions to process (can be modified)
source_extensions=("html" "js" "css")

# Build find command for extensions
find_cmd="find \"$directory\" -type f \( -false"
for ext in "${source_extensions[@]}"; do
    find_cmd+=" -o -name \"*.$ext\""
done
find_cmd+=" \)"

echo "Replacing paths in source files..."
echo "Old path: $old_path"
echo "New path: $new_path"
echo

# Process files
eval "$find_cmd" | while read -r file; do
    # Use sed for in-place replacement with backup (remove the .bak if you don't want backups)
    if sed -i.bak "s|$old_path|$new_path|g" "$file"; then
        echo "Processed: $file"
        # Remove backup file (uncomment if you want to keep backups)
        rm -f "$file.bak"
    else
        echo "Error processing: $file" >&2
    fi
done

echo "Path replacement complete."