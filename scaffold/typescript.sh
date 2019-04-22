#!/usr/bin/env bash

scaffold_typescript() {
  local bundles=(
    git
    base
    node
    webpack
    postcss
    stylelint
    # eslint
    markdown
    typescript
    tslint
    prettier
    hyperapp
  )
  setup_bundles "${bundles[@]}"
}
