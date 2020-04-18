#!/usr/bin/env bash

setup_webpack_core() {
  local modules=()

  # webpack
  # A static module bundler for modern JavaScript applications.
  # https://webpack.js.org/
  # https://www.npmjs.com/package/webpack
  modules+=('webpack')

  # webpack CLI
  # The official CLI of webpack
  # https://webpack.js.org/api/cli/
  # https://www.npmjs.com/package/webpack-cli
  modules+=('webpack-cli')

  # webpack-merge
  # Merge designed for Webpack
  # https://github.com/survivejs/webpack-merge
  # https://www.npmjs.com/package/webpack-merge
  modules+=('webpack-merge')

  # Webpack Bundle Analyzer
  # Visualize size of webpack output files with an interactive zoomable treemap.
  # https://github.com/webpack-contrib/webpack-bundle-analyzer
  # https://www.npmjs.com/package/webpack-bundle-analyzer
  modules+=('webpack-bundle-analyzer')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  mkdir -p ./webpack.config.js/setters
  mkdir -p ./src/assets/icons

  cp "$WEBDEV_BUNDLE/webpack/core/index.ejs" ./src
  cp "$WEBDEV_BUNDLE/webpack/core/index.js" ./src
  cp "$WEBDEV_BUNDLE/webpack/core/logo-ipsum.png" ./src/assets/icons

  cp "$WEBDEV_BUNDLE/webpack/core/webpack.config.js/"* ./webpack.config.js
}
