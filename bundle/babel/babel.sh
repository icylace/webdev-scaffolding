#!/usr/bin/env bash

setup_babel() {
  local devModules=()

  # TODO: start using Babel 7 when ready

  # # Babel
  # # Use next generation JavaScript, today.
  # # https://babeljs.io/
  # dev+=('@babel/core')

  devModules+=('babel-core')

  # # @babel/preset-env
  # # A Babel preset that compiles ES2015+ down to ES5.
  # # https://github.com/babel/babel/tree/master/packages/babel-preset-env
  # devModules+=('@babel/preset-env')

  devModules+=('babel-preset-env')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/babel"

  cp "$here/.babelrc" .
}
