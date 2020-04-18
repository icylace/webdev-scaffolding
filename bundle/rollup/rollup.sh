#!/usr/bin/env bash

setup_rollup() {
  local modules=()

  # Rollup
  # Next-generation ES module bundler
  # https://rollupjs.org/
  # https://www.npmjs.com/package/rollup
  modules+=('rollup')

  # @rollup/plugin-node-resolve
  # 🍣 A Rollup plugin which locates modules using the Node resolution
  # algorithm, for using third party modules in node_modules
  # https://github.com/rollup/plugins/tree/master/packages/node-resolve
  # https://www.npmjs.com/package/@rollup/plugin-node-resolve
  modules+=('@rollup/plugin-node-resolve')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/rollup/rollup.config.js" .

  update_json '.scripts += {
    "build": "npm run clean && tsc --build --incremental false && npm run bundle && npm run bundle:min:esm && npm run bundle:min:umd",
    "build:dev": "tsc --build && npm run bundle",
    "bundle": "rollup --config",
    "watch:bundle": "rollup --config --watch",
  }' ./package.json
}
