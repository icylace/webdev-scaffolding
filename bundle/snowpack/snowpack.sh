#!/usr/bin/env bash

setup_snowpack() {
  local modules=()

  # Snowpack
  # Build web applications with less tooling and 10x faster iteration.
  # https://www.snowpack.dev/
  modules+=('snowpack')

  yarn add --dev "${modules[@]}"
  # npm install --save-dev snowpack "${modules[@]}"

  # ----------------------------------------------------------------------------

  # https://www.snowpack.dev/#run-after-every-install
  local tmp="$(mktemp)"
  jq '.scripts += {
    "prepare": "npx snowpack"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
