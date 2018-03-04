#!/usr/bin/env bash

setup_babel() {
  local devFirstModules=()
  local devModules=()

  # Babel
  # Converts JavaScript of the future to the JavaScript of today.
  # https://babeljs.io/
  devFirstModules+=('babel-core')

  # babel-eslint
  # A parser for ESLint that lets it process Babel code.
  # https://github.com/babel/babel-eslint
  devModules+=('babel-eslint')

  # babel-preset-env
  # Babel preset that automatically determines the Babel plugins you need based
  # on your supported environments.
  # https://babeljs.io/docs/plugins/preset-env
  devModules+=('babel-preset-env')

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
}
