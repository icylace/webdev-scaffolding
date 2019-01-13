#!/usr/bin/env bash

setup_webpack_compression() {
  local modules=()

  # brotli plugin for webpack
  # Prepare Brotli-compressed versions of assets to serve them
  # with Content-Encoding: br
  # https://github.com/mynameiswhm/brotli-webpack-plugin
  modules+=('brotli-webpack-plugin')

  # compression-webpack-plugin
  # Prepare compressed versions of assets to serve them with Content-Encoding
  # https://github.com/webpack-contrib/compression-webpack-plugin
  modules+=('compression-webpack-plugin')

  # Imagemin plugin for Webpack
  # Plugin to compress images with imagemin
  # https://github.com/Klathmon/imagemin-webpack-plugin
  modules+=('imagemin-webpack-plugin')

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/webpack/setters/compression/compression.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/compression.js"))' >> ./webpack.config.js/setters.js
}
