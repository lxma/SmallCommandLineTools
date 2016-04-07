#!/usr/bin/env bash
################################################################################
# Pretty print all json files given as command line parameters
# e.g. pretty_print_json file1.json file2.json
# If no paramters are given, it works as a pipe (reads stdin and writes to stdout)

if [ "$#" == "0" ] ; then
    # work as pipe
    python -mjson.tool
    
else
    # work on multiple documents
    tmp=$(mktemp -t json_convert)
    for json_file in "$@"; do	
	python -mjson.tool < "$json_file" > "$tmp" \
	    && 'mv' -f "$tmp" "$json_file"
    done
    'rm' -f "$tmp"
fi
