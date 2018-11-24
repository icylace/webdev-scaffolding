#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_eslint() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # TODO: decide if/how we want to use ESLint

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  yarn add --dev eslint

  # "eslint-config-standard": "^11.0.0",
  # "eslint-plugin-import": "^2.9.0",
  # "eslint-plugin-node": "^6.0.1",
  # "eslint-plugin-promise": "^3.6.0",
  # "eslint-plugin-standard": "^3.0.1",

  # ----------------------------------------------------------------------------

  cp "$1/eslint/.eslintignore" .
  cp "$1/eslint/.eslintrc.js" .
}
