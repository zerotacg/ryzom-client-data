#!/usr/bin/env bash

set -e

base_url="http://dl.ryzom.com/patch_live"

app=${1:-ryzom_live}
output_path=${2:-version}

version_file="${app}.version"

mkdir --parents "$(dirname "${output_path}")"
curl --silent --fail "${base_url}/${version_file}" --output "${output_path/$version_file}"
