#!/bin/bash

# Check if both file names were provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <build_file> <ouput_file>"
    exit 1
fi


# Read the build file.
build_file="$1"

# Check if the build file exists.
if [ ! -f "$build_file" ]; then
    echo "Build file '$build_file' not found."
    exit 1
fi

# Read the output file. 
output_file="$2"

# Start with an empty output file.
rm $output_file && touch $output_file

# Iterate over each line in the build file.
while IFS= read -r line; do
    import=$(echo "$line" | grep "@import")

    # If it is an @import, append the contents.
    if [[ -n $import ]]; then
        # Strip the filename out of the statement.
        filename=$(echo $import | cut -d" " -f2 | sed -E 's/[;"]//g')
        # Capture the indentation of the @import statement.
        indent=${import%%@*} 
        # Add the contents of the file, indented to the right level, to the output file.
        cat $filename | sed "s/^/$indent/g" >> $output_file
    else 
        # Copy over lines that don't contain an @import statement.
        echo "$line" >> $output_file
    fi
done < "$build_file"
