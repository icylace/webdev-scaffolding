#!/usr/bin/env bash

# $1 = Directory for the tslint bundle.
setup_tslint() {
  local modules=()

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  modules+=('tslint')

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  modules+=('tslint-consistent-codestyle')

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  modules+=('tslint-divid')

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  modules+=('tslint-eslint-rules')

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  modules+=('tslint-immutable')

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  modules+=('tslint-microsoft-contrib')

  # tslint-plugin-ikatyang
  # tslint rules for ikatyang
  # https://github.com/ikatyang/tslint-plugin-ikatyang
  modules+=('tslint-plugin-ikatyang')

  # vrsource-tslint-rules
  # A extra set of tslint rules
  # https://github.com/vrsource/vrsource-tslint-rules
  modules+=('vrsource-tslint-rules')

  yarn add --dev "${modules[@]}"

  cp "$1/tslint.json" .

  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:ts": "npx tslint --project tsconfig.json --config tslint.json",
    "check:tslint": "npx tslint-config-prettier-check ./tslint.json"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
