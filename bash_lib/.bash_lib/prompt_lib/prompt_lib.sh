#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colours.sh"

PROMPT_PREPEND=""
PROMPT_APPEND=""
DEFAULT_PROMPT="\[$(echo '${PROMPT_PREPEND}')${B_GREEN}\][\@]\[${RED}$(echo '$(__git_ps1 ["%s"])')$(echo '${PROMPT_APPEND}')${B_BLUE}\]\w/\[${NO_COLOR}\]$ "

function setPrompt() {
  local ps1="$1"

  PS1="${ps1}"
}

function promptPrepend() {
  local prepend="$1"

  PROMPT_PREPEND+="${prepend}"
}

function promptAppend() {
  local append="$1"

  PROMPT_APPEND+="${append}"
}

function main() {
  setPrompt "${DEFAULT_PROMPT}"
}

main $@
