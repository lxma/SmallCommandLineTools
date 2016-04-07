#!/usr/bin/env bash
################################################################################
# jpeg-to-pdf.sh <pdf> <jpeg.1> [jpeg.2 ...]
# Konvertiere mehrere jpeg-Dateien in eine pdf-Datei.
#
# Macht gebrauch von "convert" (und nicht von gs = ghostscript)
################################################################################

# prüfe, ob "convert" existiert
if ! which convert > /dev/null; then
    echo "\"convert\" nicht gefunden. Das Programm convert gehört zu \"ImageMagick\"" 1>&2
    exit -1
fi

if (( $# < 2 )); then
    echo -e "Usage:\n$0 <target.pdf> <jpeg.1> [jpeg.2 ...]" 1>&2
    exit -1
fi
    
# prüfe, ob erstes argument eine pdf Datei ist
if ! [ "${1##*.}" == "pdf" ]; then
    echo "Zieldatei ist nicht .pdf (sondern .${1##*.})" 1>&2
    exit -1
fi

if [ -e "$1" ]; then
    echo "Zieldatei existiert bereits" 1>&2
    exit -1
fi

target="$1"
shift 1
convert "$@" "$target"
