#!/usr/bin/env bash

setup_prettier() {
  declare -n dev="$1"
  declare -n devExact="$2"

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  devExact+=('prettier')

  # stylelint-config-prettier
  # Turns off all rules that are unnecessary or might conflict with prettier.
  # https://github.com/shannonmoeller/stylelint-config-prettier
  dev+=('stylelint-config-prettier')

  # tslint-config-prettier
  # Use tslint with prettier without any conflict
  # https://github.com/alexjoverm/tslint-config-prettier
  dev+=('tslint-config-prettier')
}
