#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# $1 = Name of project.
scaffold_purescript() {
  # TODO: verify `node` is installed
  # TODO: verify `yarn` is installed
  # TODO: verify `jq` is installed
  # TODO: verify `git` is installed

  mkdir "$1"
  cd "$1"
  mkdir ./src

  # https://stackoverflow.com/a/59916
  local bundleDir="$(dirname $0)/../bundle"

  # source "$bundleDir/base/base.sh"
  # source "$bundleDir/git/git.sh"
  # source "$bundleDir/hyperapp/hyperapp.sh"
  # source "$bundleDir/node/node.sh"
  # source "$bundleDir/parcel/parcel.sh"
  # source "$bundleDir/postcss/postcss.sh"
  # source "$bundleDir/prettier/prettier.sh"
  source "$bundleDir/purescript/purescript.sh"
  # source "$bundleDir/stylelint/stylelint.sh"
  # source "$bundleDir/testers/testers.sh"

  # setup_base "$bundleDir"
  # setup_node "$bundleDir"
  # setup_git "$bundleDir"
  # setup_postcss "$bundleDir"
  # setup_stylelint "$bundleDir"
  setup_purescript
  # setup_hyperapp
  # setup_prettier "$bundleDir" stylelint
  # setup_parcel
  # setup_testers "$bundleDir"
}

scaffold_purescript "$1"
