#!/usr/bin/env bash
################################################################################
# Base 64 decode tool
if [ "$#" == "0" ] ; then
    # stdin -> stdout
    base64 -D
    
elif [ "$1" == "-d" ] ; then
    # hexdump
    shift 1
    b64.sh "$@" | hexdump -C
    
elif [ "$1" == "-j" ] ; then
    # json pretty print
    shift 1
    b64.sh "$@" | python -mjson.tool
    
elif [ "$1" == "-x" ] ; then
    # xml pretty print
    shift 1
    b64.sh "$@" | xmllint --format -
    
elif [ -f "$1" ] ; then
    # file -> stdout
    base64 -D "$1"
    
else
    # argument as input -> stdout
    echo "$1" | base64 -D
fi
   
