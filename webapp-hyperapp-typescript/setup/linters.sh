#!/usr/bin/env bash

setup_linters() {
  declare -n dev="$2"
  declare -n devFirst="$1"

  # commitlint
  # Lint commit messages
  # https://marionebl.github.io/commitlint/#/
  dev+=('@commitlint/cli')

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  devFirst+=('eslint')

  # stylelint
  # Checks the style of CSS code.
  # https://stylelint.io/
  dev+=('stylelint')
}
