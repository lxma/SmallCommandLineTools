#!/usr/bin/env bash
################################################################################
# Information about certificate files

cert_file="$1"
extension="${cert_file%%*.}"

case "$extension" in
    "pem")
        openssl x509 -in "$cert_file" -text -noout ;;
    "p12")
        openssl pkcs12 -info -in "$cert_file" ;;
    *)
        echo "Unknown format" ;;
esac
