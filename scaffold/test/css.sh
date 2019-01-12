#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
# $2 = Name of project.
scaffold_css_test() {
  mkdir "$2"
  cd "$2"
  mkdir ./src

  source "$1/postcss/postcss.sh"
  setup_postcss "$1/postcss"

  source "$1/stylelint/stylelint.sh"
  setup_stylelint "$1/stylelint" prettier
}
