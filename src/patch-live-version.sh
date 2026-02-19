#!/usr/bin/env bash

set -e

base_url="https://dl.ryzom.com/patch_live"

app="${1:-ryzom_live}"
output="${2:-dist/${app}.version}"
current="${3:-patch/${app}.version}"

output_dir="$(dirname -- "$output")"

mkdir --parents -- "$output_dir"
curl --fail --location --show-error "${base_url}/${app}.version" --output "${output}"

if git diff --quiet --no-index "${output}" "${current}"; then
    echo "changed=false"
else
    echo "changed=true"
fi
