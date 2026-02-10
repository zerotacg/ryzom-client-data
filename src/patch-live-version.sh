#!/usr/bin/env bash

set -e

base_url="https://dl.ryzom.com/patch_live"

app=${1:-ryzom_live}
output_path=${2:-dist}

version_file="${app}.version"

mkdir --parents "${output_path}"
curl --fail --location "${base_url}/${version_file}" --output "${output_path}/${version_file}"
