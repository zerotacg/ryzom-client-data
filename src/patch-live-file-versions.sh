#!/usr/bin/env bash

set -e

index_file=${1:-"index/ryzom_live.json"}
output_path=${2:-dist}

output="${output_path}/ryzom.json"

jq --from-file src/file-versions.jq-filter.txt \
  "${index_file}" \
  > "${output}"
