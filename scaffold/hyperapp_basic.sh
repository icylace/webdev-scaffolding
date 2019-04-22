#!/usr/bin/env bash

scaffold_hyperapp_basic() {
  local bundles=(
    git
    base
    prettier
    hyperapp
  )
  setup_bundles "${bundles[@]}"
}
