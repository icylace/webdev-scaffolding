#!/usr/bin/env bash

scaffold_basic_site() {
  local bundles=(
    basic_site
    git
  )
  setup_bundles "${bundles[@]}"
}
