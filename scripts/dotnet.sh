#!/bin/bash
set -euo pipefail

dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
source "$dir/logger.sh"

log_info "yo"

project="${1:-}"
config="${2:-Release}"

if [[ -z "$project" ]]; then
  log_error "Cant find the project"
  exit 1
fi

dotnet restore "$project"
dotnet build --no-restore --configuration "$config" "$project"
dotnet publish --no-build --configuration "$config" --output publish "$project"
