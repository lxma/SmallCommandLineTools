#!/usr/bin/env bash
################################################################################
# Display UTF-16LE encoded strings in Microsoft's .msg files
if [ "$@" == "1" ] ; then
    iconv -c -f utf-16le "$1" | strings | more
else
    echo "You must provide an input file name"
fi
    
