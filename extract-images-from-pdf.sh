#!/usr/bin/env bash
# extract pdf images using pdfimages from the poppler utils package

source="$1"

target="$2"

if (( "$#" < 2 )); then
    echo -e "usage\n    $0 <source pdf> <target prefix>"
    exit -1
fi

pdfimages "$source" "$target"
