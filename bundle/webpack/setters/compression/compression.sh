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

  # Imagemin Webpack
  # Webpack loader and plugin to compress images using imagemin
  # https://github.com/itgalaxy/imagemin-webpack
  modules+=('imagemin-webpack')

  # imagemin-jpegtran
  # jpegtran plugin for imagemin
  # https://github.com/imagemin/imagemin-jpegtran
  modules+=('imagemin-jpegtran')

  # imagemin-optipng
  # Imagemin plugin for OptiPNG
  # https://github.com/imagemin/imagemin-optipng
  modules+=('imagemin-optipng')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/compression/compression.js" ./webpack.config.js/setters

  echo '  require("./setters/compression.js"),' >> ./webpack.config.js/setters.js
}
