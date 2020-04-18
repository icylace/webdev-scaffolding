#!/usr/bin/env bash

setup_webpack_base() {
  local modules=()

  # Clean plugin for webpack
  # A webpack plugin to remove your build folder(s) before building
  # https://github.com/johnagan/clean-webpack-plugin
  # https://www.npmjs.com/package/clean-webpack-plugin
  modules+=('clean-webpack-plugin')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/base/base.js" ./webpack.config.js/setters

  echo 'base' >> ./webpack.config.js/setters.js
}
