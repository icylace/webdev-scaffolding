#!/usr/bin/env bash

setup_cypress() {
  local modules=()

  # Cypress
  # Fast, easy and reliable testing for anything that runs in a browser.
  # https://www.cypress.io/
  modules+=('cypress')

  yarn add --dev "${modules[@]}"
}
