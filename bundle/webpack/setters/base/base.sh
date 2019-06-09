#!/usr/bin/env bash

setup_webpack_base() {
  local modules=()

  # Clean for WebPack
  # A webpack plugin to remove your build folder(s) before building
  # https://github.com/johnagan/clean-webpack-plugin
  modules+=('clean-webpack-plugin')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/webpack/setters/base/base.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/base.js"))' >> ./webpack.config.js/setters.js
}
