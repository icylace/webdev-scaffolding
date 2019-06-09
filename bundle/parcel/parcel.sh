#!/usr/bin/env bash

setup_parcel() {
  local modules=()

  # Parcel
  # Blazing fast, zero configuration web application bundler
  # https://parceljs.org/
  modules+=('parcel-bundler')

  if [[ " $* " == *' typescript '* ]] ; then
    # parcel-plugin-typescript
    # 🚨 Enhanced TypeScript support for Parcel
    # https://www.npmjs.com/package/parcel-plugin-typescript
    modules+=('parcel-plugin-typescript')
  fi

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    build: "npx parcel build ./src/client/main.html",
    dev: "yarn serve",
    prod: "rm ./dist/* && npx parcel build ./src/client/main.html",
    serve: "npx parcel ./src/client/main.html --no-minify",
    start: "yarn serve",
    watch: "npx parcel watch ./src/client/main.html --no-minify"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
