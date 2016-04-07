#!/usr/bin/env bash
################################################################################
# To be used by emacs' ps-print commands

PDFPATH="$HOME/RIP/ps-print"
mkdir -p "$PDFPATH"
pdffile=$(date "+%Y-%m-%d-%H.%M.%S").pdf
ps2pdf - "$PDFPATH/$pdffile"
open "$PDFPATH/$pdffile"

