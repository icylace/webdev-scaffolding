#!/usr/bin/env bash

# Parameters:
# $* - Optional prettier integrations to use.
#
setup_prettier() {
  local devExactModules=()
  local devModules=()

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  devExactModules+=('prettier')

  if [[ " $* " == *"stylelint"* ]] ; then
    # stylelint-config-prettier
    # Turns off all rules that are unnecessary or might conflict with prettier.
    # https://github.com/shannonmoeller/stylelint-config-prettier
    devModules+=('stylelint-config-prettier')
  fi

  if [[ " $* " == *"tslint"* ]] ; then
    # tslint-config-prettier
    # Use tslint with prettier without any conflict
    # https://github.com/alexjoverm/tslint-config-prettier
    devModules+=('tslint-config-prettier')
  fi

  yarn add --dev --exact "${devExactModules[@]}"

  if [[ "${#devModules[@]}" > 0 ]] ; then
    yarn add --dev "${devModules[@]}"
  fi

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/prettier"

  cp "$here/.prettierignore" .
  cp "$here/prettier.config.js" .
}
