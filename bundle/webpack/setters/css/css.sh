#!/usr/bin/env bash

# $1 = Directory for webpack css settings.
setup_webpack_css() {
  local modules=()

  # css-loader
  # The css-loader interprets @import and url() like import/require() and will
  # resolve them.
  # https://github.com/webpack-contrib/css-loader
  modules+=('css-loader')

  # PostCSS Loader
  # PostCSS loader for webpack
  # https://github.com/postcss/postcss-loader
  modules+=('postcss-loader')

  # Resolve URL Loader
  # Webpack loader that resolves relative paths in url() statements based on the
  # original source file
  # https://github.com/bholloway/resolve-url-loader
  modules+=('resolve-url-loader')

  # Style Loader
  # Adds CSS to the DOM by injecting a <style> tag
  # https://github.com/webpack-contrib/style-loader
  modules+=('style-loader')

  yarn add --dev "${modules[@]}"

  cp "$1/css.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/css.js"))' >> ./webpack.config.js/setters.js
}
