#!/usr/bin/env bash

setup_formatters() {
  set +x
  declare -n devExact="$1"

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  devExact+=('prettier')
}
