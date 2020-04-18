#!/usr/bin/env bash

setup_eslint() {
  local modules=()

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  # https://www.npmjs.com/package/eslint
  modules+=('eslint')

  if [[ " $* " == *' typescript '* ]] ; then
    # ESLint Plugin TypeScript
    # ✨ Monorepo for all the tooling which enables ESLint to support TypeScript
    # https://typescript-eslint.io/
    # https://www.npmjs.com/package/@typescript-eslint/eslint-plugin
    modules+=('@typescript-eslint/eslint-plugin')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  # TODO:
  # "eslint-config-standard": "^11.0.0",
  # "eslint-plugin-import": "^2.9.0",
  # "eslint-plugin-node": "^6.0.1",
  # "eslint-plugin-promise": "^3.6.0",
  # "eslint-plugin-standard": "^3.0.1",

  cp "$WEBDEV_BUNDLE/eslint/.eslintignore" .
  cp "$WEBDEV_BUNDLE/eslint/.eslintrc.js" .
}
