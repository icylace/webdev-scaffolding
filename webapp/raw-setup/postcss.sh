#!/usr/bin/env bash


setup_postcss() {
  local devModules=()

  # PostCSS
  # Processes CSS using plugins.
  # http://postcss.org/
  devModules+=('postcss')

  # # PostCSS Browser Reporter
  # # Plugin to display warning messages right in your browser
  # # https://github.com/postcss/postcss-browser-reporter
  # devModules+=('postcss-browser-reporter')

  # PostCSS Colorblind Plugin
  # A PostCSS plugin for seeing your site as a colorblind person may.
  # https://github.com/btholt/postcss-colorblind
  devModules+=('postcss-colorblind')

  # PostCSS-cssnext
  # A PostCSS plugin to use the latest CSS.
  # http://cssnext.io/
  devModules+=('postcss-cssnext')

  # postcss-import
  # A PostCSS plugin to inline `@import` rules content.
  # https://github.com/postcss/postcss-import
  devModules+=('postcss-import')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  devModules+=('postcss-reporter')

  # # postcss-stats-reporter
  # # Prints stats from cssstats.
  # # https://github.com/jeffjewiss/postcss-stats-reporter
  # devModules+=('postcss-stats-reporter')

  # cssnano
  # Minifies CSS.
  # http://cssnano.co/
  devModules+=('cssnano')

  yarn add --dev "${devModules[@]}"
}
