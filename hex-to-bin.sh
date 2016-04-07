#!/usr/bin/env bash
################################################################################
# Convert hex string in binary file
#  sed: erase non hex characters
#  xxd: hexdump (-r: reverse, -p: plain)
if [ "$1" ]; then
    echo "Call without parameters; script reads from stdin and writes to stdout."
    exit -1
fi
sed 's/[^0-9a-fA-F]//g' | xxd -r -p
