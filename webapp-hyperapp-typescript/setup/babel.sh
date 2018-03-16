#!/usr/bin/env bash

setup_babel() {
  declare -n dev="$1"

  # TODO: Do we need Babel?

  # # Babel
  # # Use next generation JavaScript, today.
  # # https://babeljs.io/
  # dev+=('@babel/core')

  dev+=('babel-core')

  # # @babel/preset-env
  # # A Babel preset that compiles ES2015+ down to ES5.
  # # https://github.com/babel/babel/tree/master/packages/babel-preset-env
  # dev+=('@babel/preset-env')

  dev+=('babel-preset-env')
}
