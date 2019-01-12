#!/usr/bin/env bash

# $1 = Directory for the Babel bundle.
setup_babel() {
  local modules=()

  # Babel
  # Use next generation JavaScript, today.
  # https://babeljs.io/
  modules+=('@babel/core')

  # @babel/preset-env
  # A Babel preset that compiles ES2015+ down to ES5.
  # https://github.com/babel/babel/tree/master/packages/babel-preset-env
  modules+=('@babel/preset-env')

  yarn add --dev "${modules[@]}"

  cp "$1/.babelrc" .
}
