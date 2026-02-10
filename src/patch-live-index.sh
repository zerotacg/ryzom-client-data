#!/usr/bin/env bash

set -e

base_url="https://dl.ryzom.com/patch_live"

input="${1:-"dist/ryzom_live.version"}"
app="$(basename --suffix=".version" -- "$input")"
output="${2:-dist/${app}.idx}"

output_dir="$(dirname -- "$output")"
version_response=$(cat -- "$input")
version=${version_response%% *}
version_path=$(printf "%05d" "${version}")

mkdir --parents -- "$output_dir"
curl --fail --location --show-error "${base_url}/${version_path}/ryzom_${version_path}.idx" --output "${output}"
