#!/usr/bin/env bash

setup_snowpack() {
  local modules=()

  # Snowpack
  # Build web applications with less tooling and 10x faster iteration.
  # https://www.snowpack.dev/
  # https://www.npmjs.com/package/snowpack
  modules+=('snowpack')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  # https://www.snowpack.dev/#run-after-every-install
  update_json '.scripts += {
    prepare: "snowpack build"
  }' ./package.json
}
