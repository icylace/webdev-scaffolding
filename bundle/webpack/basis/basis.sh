#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_basis() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  local modules=()

  # webpack
  # A static module bundler for modern JavaScript applications.
  # https://webpack.js.org/
  # https://webpack.js.org/api/cli/
  modules+=('webpack')
  modules+=('webpack-cli')

  # webpack-dev-server
  # Serves a webpack app. Updates the browser on changes.
  # https://github.com/webpack/webpack-dev-server
  modules+=('webpack-dev-server')

  # # webpack-dev-middleware
  # # A development middleware for webpack
  # # https://github.com/webpack/webpack-dev-middleware
  # modules+=('webpack-dev-middleware')

  # # Webpack Hot Middleware
  # # Webpack hot reloading you can attach to your own server
  # # https://github.com/webpack-contrib/webpack-hot-middleware
  # modules+=('webpack-hot-middleware')

  # webpack-merge
  # Merge designed for Webpack
  # https://github.com/survivejs/webpack-merge
  modules+=('webpack-merge')

  # Clean for WebPack
  # A webpack plugin to remove your build folder(s) before building
  # https://github.com/johnagan/clean-webpack-plugin
  modules+=('clean-webpack-plugin')

  # Copy Webpack Plugin
  # Copy files and directories in webpack
  # https://github.com/kevlened/copy-webpack-plugin
  modules+=('copy-webpack-plugin')

  # file-loader
  # The file-loader resolves import/require() on a file into a url and emits the
  # file into the output directory.
  # https://github.com/webpack-contrib/file-loader
  modules+=('file-loader')

  # url-loader
  # A loader for webpack which transforms files into base64 URIs
  # https://github.com/webpack-contrib/url-loader
  modules+=('url-loader')

  # Webpack Bundle Analyzer
  # Visualize size of webpack output files with an interactive zoomable treemap.
  # https://github.com/webpack-contrib/webpack-bundle-analyzer
  modules+=('webpack-bundle-analyzer')

  yarn add --dev "${modules[@]}"

  mkdir -p ./src/client/assets/icons
  mkdir ./src/client/assets/root

  cp "$1/webpack/basis/index.ejs" ./src/client
  cp "$1/webpack/basis/index.js" ./src/client
  cp "$1/webpack/basis/logo-ipsum.png" ./src/client/assets/icons
  cp -R "$1/webpack/basis/webpack.config.js/"* ./webpack.config.js
}
