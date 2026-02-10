#!/usr/bin/env bash

set -e

input="${1:-"patch/ryzom_live.json"}"
app="$(basename --suffix=".json" -- "$input")"
output="${2:-dist/${app}.json}"

jq --from-file src/file-versions.jq-filter.txt \
  "${input}" > "${output}"
