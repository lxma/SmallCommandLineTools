#!/usr/bin/env bash

function extract() {
    video_file="$1"
    audio_file="${video_file%.*}.m4a"
    echo "##
    echo "## Extracting audio from $video_file"
    echo "##
    ffmpeg -i "$video_file" -acodec copy -vn "$audio_file"
}

for file in "$@"; do
    extract "$file"
done
