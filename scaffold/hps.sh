#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Parameters:
# $1 - Name of project.
#
init_hyperapp_purescript() {
  # TODO: verify `node` is installed
  # TODO: verify `yarn` is installed
  # TODO: verify `jq` is installed
  # TODO: verify `git` is installed

  mkdir "$1"
  cd "$1"
  mkdir ./src

  # https://stackoverflow.com/a/59916/1935675
  local bundle="$(dirname $0)/../bundle"

  # source "$bundle/base/base.sh"
  # source "$bundle/node/node.sh"
  # source "$bundle/postcss/postcss.sh"
  # source "$bundle/stylelint/stylelint.sh"
  source "$bundle/purescript/purescript.sh"
  # source "$bundle/prettier/prettier.sh"
  # source "$bundle/parcel/parcel.sh"
  # source "$bundle/git/git.sh"

  # source "$bundle/hyperapp/hyperapp.sh"
  # source "$bundle/testers/testers.sh"
  # setup_hyperapp
  # setup_testers

  # setup_base
  # setup_node
  # setup_postcss
  # setup_stylelint
  setup_purescript
  # setup_prettier 'stylelint'
  # setup_parcel
  # setup_git
}

init_hyperapp_purescript "$1"
