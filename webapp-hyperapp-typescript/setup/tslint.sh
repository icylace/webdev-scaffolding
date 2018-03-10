#!/usr/bin/env bash

setup_tslint() {
  declare -n dev="$1"

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  dev+=('tslint')

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  dev+=('tslint-consistent-codestyle')

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  dev+=('tslint-divid')

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  dev+=('tslint-eslint-rules')

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  dev+=('tslint-immutable')

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  dev+=('tslint-microsoft-contrib')

  # tslint-plugin-ikatyang
  # tslint rules for ikatyang
  # https://github.com/ikatyang/tslint-plugin-ikatyang
  dev+=('tslint-plugin-ikatyang')

  # vrsource-tslint-rules
  # A extra set of tslint rules
  # https://github.com/vrsource/vrsource-tslint-rules
  dev+=('vrsource-tslint-rules')
}
