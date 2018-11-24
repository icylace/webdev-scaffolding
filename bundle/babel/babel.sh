#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_babel() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # Babel
  # Use next generation JavaScript, today.
  # https://babeljs.io/
  yarn add --dev @babel/core

  # @babel/preset-env
  # A Babel preset that compiles ES2015+ down to ES5.
  # https://github.com/babel/babel/tree/master/packages/babel-preset-env
  yarn add --dev @babel/preset-env

  # ----------------------------------------------------------------------------

  cp "$1/babel/.babelrc" .

}
