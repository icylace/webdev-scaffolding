#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_assets() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  local modules=()

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

  yarn add --dev "${modules[@]}"

  mkdir -p ./src/client/assets/root

  cp "$1/webpack/setters/assets/assets.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/assets.js"))' >> ./webpack.config.js/setters.js
}
