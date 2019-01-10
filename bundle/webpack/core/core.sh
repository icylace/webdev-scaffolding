#!/usr/bin/env bash

# $1 = Directory containing scaffold for webpack core.
setup_webpack_core() {
  local modules=()

  # webpack
  # A static module bundler for modern JavaScript applications.
  # https://webpack.js.org/
  # https://webpack.js.org/api/cli/
  modules+=('webpack')
  modules+=('webpack-cli')

  # webpack-merge
  # Merge designed for Webpack
  # https://github.com/survivejs/webpack-merge
  modules+=('webpack-merge')

  # Webpack Bundle Analyzer
  # Visualize size of webpack output files with an interactive zoomable treemap.
  # https://github.com/webpack-contrib/webpack-bundle-analyzer
  modules+=('webpack-bundle-analyzer')

  yarn add --dev "${modules[@]}"

  mkdir -p ./webpack.config.js/setters
  mkdir -p ./src/client/assets/icons

  # cp "$1/webpack/core/index.ejs" ./src/client
  cp "$1/index.ejs" ./src/client
  cp "$1/index.js" ./src/client
  cp "$1/logo-ipsum.png" ./src/client/assets/icons

  cp "$1/webpack.config.js/"* ./webpack.config.js
}
