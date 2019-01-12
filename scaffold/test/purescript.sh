#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
# $2 = Name of project.
scaffold_purescript_test() {
  mkdir "$2"
  cd "$2"
  mkdir ./src

  source "$1/purescript/purescript.sh"
  setup_purescript "$1/purescript"
}
