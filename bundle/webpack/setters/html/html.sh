#!/usr/bin/env bash

setup_webpack_html() {
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

  cp "$WEBDEV_BUNDLE/webpack/setters/html/html.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/html.js"))' >> ./webpack.config.js/setters.js
}
