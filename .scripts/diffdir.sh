#!/bin/bash
# custom-difftool.sh - Script to exclude certain files/directories

# Define the patterns to exclude
EXCLUDE_PATTERNS=("*.log" "path/to/excluded/directory/*" ".git/*" "*.DS_Store")

# Function to check if a file should be excluded
should_exclude() {
    local file=$1
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        if [[ "$file" == $pattern ]]; then
            return 0
        fi
    done
    return 1
}

# Function to perform recursive diff
recursive_diff() {
    local dir1=$1
    local dir2=$2

    # List all files in both directories, excluding specified patterns
    find "$dir1" "$dir2" \( \
        -path "*/.git/*" -o \
        -name "*.DS_Store" -o \
        -name "*.log" -o \
        -path "*/path/to/excluded/directory/*" \
    \) -prune -o -type f -print | sort -u | while read file; do
        relative_path=${file#"$dir1"}
        file1="$dir1/$relative_path"
        file2="$dir2/$relative_path"

        if [[ -f "$file1" && -f "$file2" ]]; then
            # Check if files are different
            if ! diff -q "$file1" "$file2" > /dev/null; then
                # lvim -d -u ~/.vimrc "$file1" "$file2"
                # lvim -d -u ~/.config/lvim/config.lua "$file1" "$file2"
                nvim -d -u ~/.config/nvim/init.lua -c "windo set wrap" "$file1" "$file2"
            fi
        elif [[ -f "$file1" ]]; then
            echo "Only in $dir1: $relative_path"
        elif [[ -f "$file2" ]]; then
            echo "Only in $dir2: $relative_path"
        fi
    done
}

# Call the recursive diff function with the provided directories
recursive_diff "$1" "$2"

