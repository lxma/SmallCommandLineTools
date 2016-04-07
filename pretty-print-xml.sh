#!/usr/bin/env bash
################################################################################
# Pretty print all xml files given as command line parameters
# e.g. pretty_print_xml file1.xml file2.xml file3.xml
# If no parameters are given, it works as a pipe (reads stdin and writes to stdout)

if [ "$#" == "0" ] ; then
    # work as pipe
    xmllint --format -

else
    # work on multiple documents
    tmp=$(mktemp -t xml_convert)
    #export XMLLINT_INDENT=$(echo -en "\t") # will insert tabs instead of "  " as indent
    for xml_file in "$@"; do	
	xmllint --format "$xml_file" > "$tmp" \
	    && 'mv' -f "$tmp" "$xml_file"
    done
    'rm' -f "$tmp"
fi
