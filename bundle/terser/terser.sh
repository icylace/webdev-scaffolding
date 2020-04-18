#!/usr/bin/env bash

setup_terser() {
  local modules=()

  # Terser
  # JavaScript parser, mangler and compressor toolkit for ES6+
  # https://terser.org/
  # https://www.npmjs.com/package/terser
  modules+=('terser')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  update_json '.scripts += {
    "bundle:min:esm": "terser --ecma 6 --compress --mangle --module --output ./dist/index.min.js -- ./dist/index.js && gzip --best --to-stdout ./dist/index.min.js > ./dist/index.min.js.gz",
    "bundle:min:umd": "terser --ecma 6 --compress --mangle --output ./dist/index.umd.min.js -- ./dist/index.umd.js && gzip --best --to-stdout ./dist/index.umd.min.js > ./dist/index.umd.min.js.gz",
  }' ./package.json
}
