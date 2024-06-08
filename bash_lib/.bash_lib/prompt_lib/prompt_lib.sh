#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colours.sh"

PROMPT_PREPEND=""
PROMPT_APPEND=""

function setPrompt() {
  local ps1="$1"

  PS1="${ps1}";
}

function promptPrepend() {
  local prepend="$1"

  PROMPT_PREPEND+="${prepend}";
}

function promptAppend() {
  local append="$1"

  PROMPT_APPEND+="${append}";
}