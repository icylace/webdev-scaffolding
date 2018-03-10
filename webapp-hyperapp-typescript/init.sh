#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

init() {
  if [ -z "$1" ] ; then
    echo "You need to name your new project!"
    return 1
  fi

  shopt -s dotglob

  # https://stackoverflow.com/a/59916/1935675
  local here="$(dirname $0)"

  mkdir -v "$1"
  cd "$1"
  mkdir -v './dist'
  cp -pRv "$here/project/"* .
  mkdir -v './src/client/assets'

  source "$here/setup/babel.sh"
  source "$here/setup/hyperapp.sh"
  source "$here/setup/linters.sh"
  source "$here/setup/parcel.sh"
  source "$here/setup/postcss.sh"
  source "$here/setup/prettier.sh"
  source "$here/setup/stylelint.sh"
  source "$here/setup/testers.sh"
  source "$here/setup/tslint.sh"
  source "$here/setup/typescript.sh"

  local devExactModules=()
  local devFirstModules=()
  local devModules=()
  local modules=()

  setup_babel devModules
  setup_hyperapp devModules modules
  setup_linters devModules devFirstModules
  setup_parcel devModules
  setup_postcss devModules
  setup_prettier devModules devExactModules
  setup_stylelint devModules
  setup_testers devModules
  setup_tslint devModules
  setup_typescript devModules

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
  yarn add --dev --exact "${devExactModules[@]}"
  yarn add "${modules[@]}"

  git init
  git config core.hooksPath .githooks
  git add --all
  git commit --message='build: Scaffold a new project.'
}

init "$1"
