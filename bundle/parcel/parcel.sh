#!/usr/bin/env bash

setup_parcel() {
  local modules=()

  # Parcel
  # Blazing fast, zero configuration web application bundler
  # https://parceljs.org/
  modules+=('parcel-bundler')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    dev: "npx parcel ./src/client/main.html",
    prod: "rm ./dist/* && npx parcel build ./src/client/main.html",
    start: "yarn run dev",
    watch: "npx parcel watch ./src/client/main.html"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
