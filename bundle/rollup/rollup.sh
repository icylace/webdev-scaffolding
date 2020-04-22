#!/usr/bin/env bash

setup_rollup() {
  local modules=()

  # Rollup
  # Next-generation ES module bundler
  # https://rollupjs.org/
  # https://www.npmjs.com/package/rollup
  modules+=('rollup')

  # # TODO:
  # # @rollup/plugin-node-resolve
  # # 🍣 A Rollup plugin which locates modules using the Node resolution
  # # algorithm, for using third party modules in node_modules
  # # https://github.com/rollup/plugins/tree/master/packages/node-resolve
  # # https://www.npmjs.com/package/@rollup/plugin-node-resolve
  # modules+=('@rollup/plugin-node-resolve')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/rollup/rollup.config.js" .

  update_json '.scripts += {
    "bundle": "rollup --config",
    "bundle:watch": "rollup --config --watch",
  }' ./package.json
}
