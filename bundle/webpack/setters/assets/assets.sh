#!/usr/bin/env bash

setup_webpack_assets() {
  local modules=()

  # Copy Webpack Plugin
  # Copy files and directories in webpack
  # https://github.com/kevlened/copy-webpack-plugin
  # https://www.npmjs.com/package/copy-webpack-plugin
  modules+=('copy-webpack-plugin')

  # file-loader
  # The file-loader resolves import/require() on a file into a url and emits the
  # file into the output directory.
  # https://github.com/webpack-contrib/file-loader
  # https://www.npmjs.com/package/file-loader
  modules+=('file-loader')

  # url-loader
  # A loader for webpack which transforms files into base64 URIs
  # https://github.com/webpack-contrib/url-loader
  # https://www.npmjs.com/package/url-loader
  modules+=('url-loader')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  mkdir -p ./src/assets/root

  cp "$WEBDEV_WEBPACK_SETTERS/assets/assets.js" ./webpack.config.js/setters

  echo 'assets' >> ./webpack.config.js/setters.js
}
