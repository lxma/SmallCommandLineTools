#!/bin/sh

output="$1"
shift
if [ -f "$output" ]; then
    echo "-------------------------------------------------------------------------"
    echo " output file \"$output\" already exists !"
    echo "-------------------------------------------------------------------------"
    exit
fi
    
echo "-------------------------------------------------------------------------"
echo " Output goes to $output"
echo "-------------------------------------------------------------------------"

gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile="$output" "$@"

