#!/bin/bash

new_file_name=$(echo "$1" | tr -d "\r")
counter=0
file_path="/files-to-rename/"
for file in "$file_path"*; do
    (( counter++ ))
    mv -- "$file" "$file_path$new_file_name$counter.${file##*.}"
done
