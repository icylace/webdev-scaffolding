#!/usr/bin/env bash

setup_parcel() {
  local devModules=()

  # Parcel
  # Blazing fast, zero configuration web application bundler
  # https://parceljs.org/
  devModules+=('parcel-bundler')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    dev: "parcel ./src/client/main.html",
    prod: "rm ./dist/* && parcel build ./src/client/main.html",
    start: "yarn run dev",
    watch: "parcel watch ./src/client/main.html"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}