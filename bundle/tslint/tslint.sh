#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_tslint() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  yarn add --dev tslint

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  yarn add --dev tslint-consistent-codestyle

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  yarn add --dev tslint-divid

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  yarn add --dev tslint-eslint-rules

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  yarn add --dev tslint-immutable

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  yarn add --dev tslint-microsoft-contrib

  # tslint-plugin-ikatyang
  # tslint rules for ikatyang
  # https://github.com/ikatyang/tslint-plugin-ikatyang
  yarn add --dev tslint-plugin-ikatyang

  # vrsource-tslint-rules
  # A extra set of tslint rules
  # https://github.com/vrsource/vrsource-tslint-rules
  yarn add --dev vrsource-tslint-rules

  # ----------------------------------------------------------------------------

  cp "$1/tslint/tslint.json" .

  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:ts": "tslint --project tsconfig.json --config tslint.json",
    "check:tslint": "tslint-config-prettier-check ./tslint.json"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
