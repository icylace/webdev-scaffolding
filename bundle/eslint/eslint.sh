#!/usr/bin/env bash

setup_eslint() {
  local modules=()

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  modules+=('eslint')

  yarn add --dev "${modules[@]}"

  # TODO:
  # "eslint-config-standard": "^11.0.0",
  # "eslint-plugin-import": "^2.9.0",
  # "eslint-plugin-node": "^6.0.1",
  # "eslint-plugin-promise": "^3.6.0",
  # "eslint-plugin-standard": "^3.0.1",

  cp "$WEBDEV_BUNDLE/eslint/.eslintignore" .
  cp "$WEBDEV_BUNDLE/eslint/.eslintrc.js" .
}
