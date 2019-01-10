#!/usr/bin/env bash

# $1 = Directory for webpack PureScript settings.
setup_webpack_purescript() {
  local modules=()

  # purs-loader
  # PureScript loader for webpack
  # https://github.com/ethul/purs-loader
  modules+=('purs-loader')

  yarn add --dev "${modules[@]}"

  cp "$1/purescript.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/purescript.js"))' >> ./webpack.config.js/setters.js
}
