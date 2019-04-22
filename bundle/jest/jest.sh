#!/usr/bin/env bash

setup_jest() {
  local modules=()

  # Jest
  # Delightful JavaScript Testing
  # https://facebook.github.io/jest/
  modules+=('jest')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/testers/jest.config.js" .

  local tmp="$(mktemp)"

  jq '.scripts += {
    test: "npx jest",
    "test:coverage": "npx jest --coverage"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
