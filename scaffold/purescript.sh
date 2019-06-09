#!/usr/bin/env bash

scaffold_purescript() {
  local bundles=(
    base
    git
    node
    webpack
    # markdown
    postcss
    stylelint
    purescript
    prettier
    hyperapp
  )
  setup_bundles "${bundles[@]}"
}
