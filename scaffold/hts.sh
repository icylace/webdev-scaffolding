#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# Parameters:
# $1 - Name of project.
#
init_hyperapp_typescript() {
  # TODO: verify `node` is installed
  # TODO: verify `yarn` is installed
  # TODO: verify `jq` is installed
  # TODO: verify `git` is installed

  mkdir "$1"
  cd "$1"
  mkdir ./src

  # https://stackoverflow.com/a/59916/1935675
  local bundle="$(dirname $0)/../bundle"

  source "$bundle/base/base.sh"
  source "$bundle/node/node.sh"
  # source "$bundle/markdown/markdown.sh"
  # source "$bundle/babel/babel.sh"
  # source "$bundle/eslint/eslint.sh"
  # source "$bundle/postcss/postcss.sh"
  # source "$bundle/stylelint/stylelint.sh"
  # source "$bundle/hyperapp/hyperapp.sh"
  # source "$bundle/typescript/typescript.sh"
  # source "$bundle/tslint/tslint.sh"
  # source "$bundle/prettier/prettier.sh"
  # source "$bundle/parcel/parcel.sh"
  # source "$bundle/testers/testers.sh"
  # source "$bundle/git/git.sh"

  setup_base
  setup_node
  # setup_markdown
  # setup_babel
  # setup_eslint
  # setup_postcss
  # setup_stylelint
  # setup_hyperapp
  # setup_typescript 'jest'
  # setup_tslint
  # setup_prettier 'stylelint' 'tslint'
  # setup_parcel
  # setup_testers
  # setup_git
}

init_hyperapp_typescript "$1"
