#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_html() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  local modules=()

  # HTML Webpack Plugin
  # Simplifies creation of HTML files to serve your webpack bundles
  # https://github.com/jantimon/html-webpack-plugin
  modules+=('html-webpack-plugin')

  # Webapp Webpack Plugin
  # Let webpack generate your progressive web app icons for you
  # https://github.com/brunocodutra/webapp-webpack-plugin
  modules+=('webapp-webpack-plugin')

  # webpack-subresource-integrity
  # Webpack plugin for enabling Subresource Integrity.
  # https://github.com/waysact/webpack-subresource-integrity
  modules+=('webpack-subresource-integrity')

  yarn add --dev "${modules[@]}"

  cp "$1/webpack/html/html.js" ./webpack.config.js
}
