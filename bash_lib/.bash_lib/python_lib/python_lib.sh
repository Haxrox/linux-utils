#!/bin/bash

function get_venv() {
  local venv="$1"

  venv=${venv:=.venv}

  echo "${venv}"
}

function get_python() {
  local python_path="$1"

  python_path=${python_path:=python3}

  echo "${python_path}"
}

function py_venv() {
  local venv_name=$(get_venv "$1")
  local python_path=$(get_python "$2")

  if [ ! -d "${venv_name}" ]; then
    local cmd="${python_path} -m venv ${venv_name}"
    echo "[HAXBASH_LIB] Python | ${venv_name} doesn't exist. Running: '${cmd}'"
    ${cmd}
  fi

  py_activate "${venv_name}"
}

function py_install() {
  local package_name="$1"
  local python_path=$(get_python "$2")

  if [ -z "package_name" ]; then
    echo "Usage: py_install <package_name>"
    return 1
  fi

  local cmd="${python_path} -m pip install ${package_name}"
  echo "[HAXBASH_LIB] Python | Installing package: ${package_name}: '${cmd}'"
  ${cmd}
}

function py_activate() {
  local venv_name="$1"

  venv_name=${venv_name:=.venv};

  echo "[HAXBASH_LIB] Python | Activating ${venv_name}: 'source ${venv_name}/bin/activate'"
  source "${venv_name}/bin/activate"
}