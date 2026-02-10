#!/usr/bin/env bash

set -e

input="${1:-dist/files/*.bnp}"
output_dir="${2:-data}"

for file in $input ; do
  output="$output_dir/$(basename --suffix=".bnp" -- "$file")"
  echo "UNPACK ${file} to $output"
  mkdir --parents "$output"
  bnp_make  --unpack --output "$output/" "$file"
done