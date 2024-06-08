#!/bin/bash

DEBUG=0;

TARGET_ROOT="${HOME}"
BASHRC="${TARGET_ROOT}/.bashrc"
BASH_LIB=".bash_lib"
BASH_PERSONAL="${BASH_LIB}/bash_personal"
SOURCE_BASH_PERSONAL="source ${TARGET_ROOT}/${BASH_PERSONAL}"

if (( ${DEBUG} )); then
  echo "[UBUNTU] BASHRC: ${BASHRC}"
  echo "[UBUNTU] TARGET_ROOT: ${TARGET_ROOT}"
  echo "[UBUNTU] BASH_PERSONAL: ${BASH_PERSONAL}"
  echo "[UBUNTU] SOURCE_BASH_PERSONAL: ${SOURCE_BASH_PERSONAL}"
fi

# Check if line has been sourced yet
if ! (cat "${BASHRC}" | grep -q "^${SOURCE_BASH_PERSONAL}"); then
  echo "[UBUNTU] Adding '${SOURCE_BASH_PERSONAL}' to ${BASHRC}"

  if (( DEBUG )); then
    echo "[UBUNTU] Debug | Appending ${SOURCE_BASH_PERSONAL} to ${BASHRC}"
  else
    echo -e "\n${SOURCE_BASH_PERSONAL}" >> "${BASHRC}"
  fi
fi

echo "[UBUNTU] Updating ${BASH_LIB} contents"

if (( ${DEBUG} )); then
  echo "[UBUNTU] Debug | Copying ${BASH_LIB} into ${TARGET_ROOT}"
else
  cp -r ${BASH_LIB} ${TARGET_ROOT}
fi