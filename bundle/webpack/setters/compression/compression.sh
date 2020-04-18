#!/usr/bin/env bash

setup_webpack_compression() {
  local modules=()

  # brotli plugin for webpack
  # Prepare Brotli-compressed versions of assets to serve them
  # with Content-Encoding: br
  # https://github.com/mynameiswhm/brotli-webpack-plugin
  # https://www.npmjs.com/package/
  modules+=('brotli-webpack-plugin')

  # compression-webpack-plugin
  # Prepare compressed versions of assets to serve them with Content-Encoding
  # https://github.com/webpack-contrib/compression-webpack-plugin
  # https://www.npmjs.com/package/
  modules+=('compression-webpack-plugin')

  # Imagemin Webpack
  # Webpack loader and plugin to compress images using imagemin
  # https://github.com/itgalaxy/imagemin-webpack
  # https://www.npmjs.com/package/
  modules+=('imagemin-webpack')

  # imagemin-jpegtran
  # jpegtran plugin for imagemin
  # https://github.com/imagemin/imagemin-jpegtran
  # https://www.npmjs.com/package/
  modules+=('imagemin-jpegtran')

  # imagemin-optipng
  # Imagemin plugin for OptiPNG
  # https://github.com/imagemin/imagemin-optipng
  # https://www.npmjs.com/package/
  modules+=('imagemin-optipng')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/compression/compression.js" ./webpack.config.js/setters

  echo 'compression' >> ./webpack.config.js/setters.js
}
