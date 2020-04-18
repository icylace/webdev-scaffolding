#!/usr/bin/env bash

setup_webpack_html() {
  local modules=()

  # # TODO:
  # # - use `favicons-webpack-plugin` instead
  # #
  # # Webapp Webpack Plugin
  # # Let webpack generate your progressive web app icons for you
  # # https://github.com/brunocodutra/webapp-webpack-plugin
  # # https://www.npmjs.com/package/webapp-webpack-plugin
  # modules+=('webapp-webpack-plugin')

  # TODO:
  # - use this
  #
  # Favicons Webpack Plugin
  # Let webpack generate all your favicons and icons for you
  # https://github.com/jantimon/favicons-webpack-plugin
  # https://www.npmjs.com/package/favicons-webpack-plugin
  modules+=('favicons-webpack-plugin')

  # HTML Webpack Plugin
  # Simplifies creation of HTML files to serve your webpack bundles
  # https://github.com/jantimon/html-webpack-plugin
  # https://www.npmjs.com/package/html-webpack-plugin
  modules+=('html-webpack-plugin')

  # webpack-subresource-integrity
  # Webpack plugin for enabling Subresource Integrity.
  # https://github.com/waysact/webpack-subresource-integrity
  # https://www.npmjs.com/package/webpack-subresource-integrity
  modules+=('webpack-subresource-integrity')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/html/html.js" ./webpack.config.js/setters

  echo 'html' >> ./webpack.config.js/setters.js
}
