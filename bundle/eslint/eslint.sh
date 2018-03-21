#!/usr/bin/env bash

setup_eslint() {
  local devModules=()

  # TODO: decide if/how we want to use ESLint

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  devModules+=('eslint')

  # "eslint-config-standard": "^11.0.0",
  # "eslint-plugin-import": "^2.9.0",
  # "eslint-plugin-node": "^6.0.1",
  # "eslint-plugin-promise": "^3.6.0",
  # "eslint-plugin-standard": "^3.0.1",

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/eslint"

  cp "$here/.eslintignore" .
  cp "$here/.eslintrc.js" .
}
