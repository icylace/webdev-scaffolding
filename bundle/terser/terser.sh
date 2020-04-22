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
    "gzip": "npm run gzip:esm && npm run gzip:umd",
    "gzip:esm": "gzip --best --to-stdout ./output/terser/index.min.js > ./output/gzip/index.min.js.gz",
    "gzip:umd": "gzip --best --to-stdout ./output/terser/index.umd.min.js > ./output/gzip/index.umd.min.js.gz",

    "min": "npm run min:esm && npm run min:umd",
    "min:esm": "terser --ecma 6 --compress --mangle --module --output ./output/terser/index.min.js -- ./output/rollup/index.js",
    "min:umd": "terser --ecma 6 --compress --mangle --output ./output/terser/index.umd.min.js -- ./output/rollup/index.umd.js",
  }' ./package.json
}
