#!/usr/bin/env bash

scaffold_purescript() {
  local bundles=(
    git
    base
    node
    webpack
    postcss
    stylelint
    purescript
    prettier
    hyperapp
    testers
  )
  setup_bundles "${bundles[@]}"
}
