#!/bin/bash

set -euo pipefail

RESET="\033[0m"
BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
BLUE="\033[34m"


_now(){
  date +"%Y-%m-%dT%H:%M:%S.%3N%z"
}

_log(){
  local level="$1"
  local color="$2"
  shift 2
  local msg="$*"
  local ts=$(_now)
  printf "%b[%s] [%s]%b %s\n" "$color" "$ts" "$level" "$RESET" "$msg"
}

log_info(){ _log "INFO" "$GREEN" "$@"; }
log_warn(){ _log "WARN" "$YELLOW" "$@"; }
log_error(){ _log "ERROR" "$RED" "$@"; }
log_debug(){ _log "DEBUG" "$BLUE" "$@"; }
