#!/usr/bin/env bash

set -e

base_url="https://dl.ryzom.com/patch_live"

input="${1:-dist/ryzom_live.json}"
output_dir="${2:-dist/files}"

mkdir --parents -- "$output_dir"

jq --raw-output '.[] | "\(.version) \(.filename)"' "$input" |
while read -r version filename; do
  version_path=$(printf "%05d" "${version}")
  output_file="${output_dir}/${filename}.lzma"

  if [ ! -f "$output_file" ]; then
    url="${base_url}/${version_path}/${filename}.lzma"
    echo "DOWNLOAD ${filename} v${version}"
    curl --fail --location --show-error "$url" --output "$output_file"
  fi

  output_file_decompress="${output_dir}/${filename}"
  if [ ! -f "$output_file_decompress" ]; then
    echo "DECOMPRESS ${filename} $output_file"
    xz --decompress --keep --format=lzma "$output_file"
  fi
done
