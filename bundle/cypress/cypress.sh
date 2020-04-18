#!/usr/bin/env bash

setup_cypress() {
  local modules=()

  # Cypress
  # Fast, easy and reliable testing for anything that runs in a browser.
  # https://www.cypress.io/
  # https://www.npmjs.com/package/cypress
  modules+=('cypress')

  npm install --save-dev "${modules[@]}"
}
