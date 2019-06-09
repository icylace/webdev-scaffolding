#!/usr/bin/env bash

scaffold_vanilla() {
  local bundles=(
    base
    git
    prettier
    hyperapp
  )
  setup_bundles "${bundles[@]}"
}
