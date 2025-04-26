#!/bin/bash

# Script to remove leading underscores from directories and update paths in source files

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <root_directory>"
    echo "Example: $0 /path/to/project"
    exit 1
fi

root_dir="$1"
temp_file="/tmp/underscore_dirs.txt"

# Find all directories starting with underscore and process them in reverse depth order
echo "Finding directories with leading underscores..."
find "$root_dir" -type d -name '_*' | sort -r > "$temp_file"

if [ ! -s "$temp_file" ]; then
    echo "No directories with leading underscores found."
    rm -f "$temp_file"
    exit 0
fi

echo "Found directories to process:"
cat "$temp_file"
echo

# Process each directory
while IFS= read -r dir_path; do
    dir_name=$(basename "$dir_path")
    parent_dir=$(dirname "$dir_path")
    new_dir_name="${dir_name#_}"  # Remove leading underscore
    
    # Skip if the directory name was just an underscore
    if [ -z "$new_dir_name" ]; then
        echo "Skipping directory that's just an underscore: $dir_path"
        continue
    fi
    
    # Calculate old and new paths for replacement
    old_path="${dir_path#$root_dir}"
    new_path="${old_path#_}"  # Remove leading underscore from path
    
    # Only proceed if we have paths to replace
    if [ "$old_path" != "$new_path" ]; then
        echo "Processing directory: $dir_path"
        echo "  Old path: $old_path"
        echo "  New path: $new_path"
        
        # Call the path replacement script
        if ! ./replace_path.sh "$root_dir" "$old_path" "$new_path"; then
            echo "Error: Path replacement failed for $dir_path" >&2
            continue
        fi
        
        # Rename the directory
        echo "  Renaming directory to: $new_dir_name"
        if ! mv "$dir_path" "$parent_dir/$new_dir_name"; then
            echo "Error: Failed to rename directory $dir_path" >&2
            continue
        fi
    else
        echo "Skipping directory with no path change: $dir_path"
    fi
done < "$temp_file"

rm -f "$temp_file"
echo "Directory underscore removal complete."