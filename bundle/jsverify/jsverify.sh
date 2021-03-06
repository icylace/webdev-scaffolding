#!/usr/bin/env bash

setup_jsverify() {
  local modules=()

  # JSVerify
  # JSVerify is a property-based testing library, highly inspired by QuickCheck.
  # https://jsverify.github.io/
  # https://www.npmjs.com/package/jsverify
  modules+=('jsverify')

  npm install --save-dev "${modules[@]}"
}
