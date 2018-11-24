#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# $1 - Name of project.
scaffold_typescript() {
  # TODO: verify `node` is installed
  # TODO: verify `yarn` is installed
  # TODO: verify `jq` is installed
  # TODO: verify `git` is installed

  mkdir "$1"
  cd "$1"
  mkdir ./src

  # https://stackoverflow.com/a/59916
  local bundleDir="$(dirname $0)/../bundle"

  # source "$bundleDir/babel/babel.sh"
  source "$bundleDir/base/base.sh"
  # source "$bundleDir/eslint/eslint.sh"
  # source "$bundleDir/git/git.sh"
  # source "$bundleDir/hyperapp/hyperapp.sh"
  # source "$bundleDir/markdown/markdown.sh"
  source "$bundleDir/node/node.sh"
  # source "$bundleDir/parcel/parcel.sh"
  # source "$bundleDir/postcss/postcss.sh"
  # source "$bundleDir/prettier/prettier.sh"
  # source "$bundleDir/stylelint/stylelint.sh"
  # source "$bundleDir/testers/testers.sh"
  # source "$bundleDir/tslint/tslint.sh"
  # source "$bundleDir/typescript/typescript.sh"

  setup_base "$bundleDir"
  setup_node "$bundleDir"
  # setup_markdown "$bundleDir"
  # setup_babel "$bundleDir"
  # setup_eslint "$bundleDir"
  # setup_postcss "$bundleDir"
  # setup_stylelint "$bundleDir"
  # setup_hyperapp
  # setup_typescript 'jest'
  # setup_tslint "$bundleDir"
  # setup_prettier "$bundleDir" stylelint tslint
  # setup_parcel
  # setup_testers "$bundleDir"
  # setup_git "$bundleDir"
}

scaffold_typescript "$1"
