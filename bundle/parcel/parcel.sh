#!/usr/bin/env bash

setup_parcel() {
  local modules=()

  # Parcel
  # Blazing fast, zero configuration web application bundler
  # https://parceljs.org/
  # https://www.npmjs.com/package/parcel-bundler
  modules+=('parcel-bundler')

  if [[ " $* " == *' typescript '* ]] ; then
    # parcel-plugin-typescript
    # 🚨 Enhanced TypeScript support for Parcel
    # https://github.com/fathyb/parcel-plugin-typescript
    # https://www.npmjs.com/package/parcel-plugin-typescript
    modules+=('parcel-plugin-typescript')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  update_json '.scripts += {
    build: "parcel build ./src/main.html",
    build:prod: "npm run clean && parcel build ./src/main.html",
    dev: "npm run serve",
    serve: "parcel ./src/main.html --no-minify",
    start: "npm run serve",
    watch: "parcel watch ./src/main.html --no-minify"
  }' ./package.json
}
