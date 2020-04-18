#!/usr/bin/env bash

setup_webpack_css() {
  local modules=()

  # css-loader
  # The css-loader interprets @import and url() like import/require() and will
  # resolve them.
  # https://github.com/webpack-contrib/css-loader
  # https://www.npmjs.com/package/css-loader
  modules+=('css-loader')

  # PostCSS Loader
  # PostCSS loader for webpack
  # https://github.com/postcss/postcss-loader
  # https://www.npmjs.com/package/postcss-loader
  modules+=('postcss-loader')

  # Resolve URL Loader
  # Webpack loader that resolves relative paths in url() statements based on the
  # original source file
  # https://github.com/bholloway/resolve-url-loader
  # https://www.npmjs.com/package/resolve-url-loader
  modules+=('resolve-url-loader')

  # Style Loader
  # Adds CSS to the DOM by injecting a <style> tag
  # https://github.com/webpack-contrib/style-loader
  # https://www.npmjs.com/package/style-loader
  modules+=('style-loader')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/css/css.js" ./webpack.config.js/setters

  echo 'css' >> ./webpack.config.js/setters.js
}
