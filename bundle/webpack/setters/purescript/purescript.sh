#!/usr/bin/env bash

setup_webpack_purescript() {
  local modules=()

  # purs-loader
  # PureScript loader for webpack
  # https://github.com/ethul/purs-loader
  modules+=('purs-loader')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/webpack/setters/purescript/purescript.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/purescript.js"))' >> ./webpack.config.js/setters.js
}
