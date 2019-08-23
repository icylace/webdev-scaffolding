#!/usr/bin/env bash

setup_webpack_purescript() {
  local modules=()

  # purs-loader
  # PureScript loader for webpack
  # https://github.com/ethul/purs-loader
  modules+=('purs-loader')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/purescript/purescript.js" ./webpack.config.js/setters

  echo 'purescript' >> ./webpack.config.js/setters.js
}
