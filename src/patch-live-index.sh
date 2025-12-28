#!/usr/bin/env bash

set -e

base_url="https://dl.ryzom.com/patch_live"

version_file=${1:-"version/ryzom_live.version"}
output_path=${2:-dist}

version_response=$(cat "${version_file}")
version=${version_response%% *}
version_path=$(printf "%05d" "${version}")
index_url="${base_url}/${version_path}/ryzom_${version_path}.idx"
output="${output_path}/ryzom.idx"

mkdir --parents "${output_path}"
curl --fail --location "$index_url" --output "${output}"
