#!/usr/bin/env bash

setup_tslint() {
  local devModules=()

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  devModules+=('tslint')

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  devModules+=('tslint-consistent-codestyle')

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  devModules+=('tslint-divid')

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  devModules+=('tslint-eslint-rules')

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  devModules+=('tslint-immutable')

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  devModules+=('tslint-microsoft-contrib')

  # tslint-plugin-ikatyang
  # tslint rules for ikatyang
  # https://github.com/ikatyang/tslint-plugin-ikatyang
  devModules+=('tslint-plugin-ikatyang')

  # vrsource-tslint-rules
  # A extra set of tslint rules
  # https://github.com/vrsource/vrsource-tslint-rules
  devModules+=('vrsource-tslint-rules')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/tslint"

  cp "$here/tslint.json" .

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:ts": "tslint --project tsconfig.json --config tslint.json",
    "check:tslint": "tslint-config-prettier-check ./tslint.json"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
