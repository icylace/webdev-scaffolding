#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_compression() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

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

  cp "$1/webpack/compression/compression.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/compression.js"))' >> ./webpack.config.js/setters.js
}
