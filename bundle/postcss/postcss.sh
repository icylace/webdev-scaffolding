#!/usr/bin/env bash

# $1 = Directory for the PostCSS bundle.
setup_postcss() {
  local modules=()

  # PostCSS
  # Processes CSS using plugins.
  # http://postcss.org/
  modules+=('postcss')

  # cssnano
  # cssnano takes your nicely formatted CSS and runs it through many focused
  # optimisations, to ensure that the final result is as small as possible
  # for a production environment.
  # https://cssnano.co/
  modules+=('cssnano')

  # # PostCSS Colorblind Plugin
  # # A PostCSS plugin for seeing your site as a colorblind person may.
  # # https://github.com/btholt/postcss-colorblind
  # yarn add --dev postcss-colorblind
  modules+=('postcss-colorblind')

  # PostCSS-cssnext
  # A PostCSS plugin to use the latest CSS.
  # http://cssnext.io/
  modules+=('postcss-cssnext')

  # postcss-import
  # A PostCSS plugin to inline `@import` rules content.
  # https://github.com/postcss/postcss-import
  modules+=('postcss-import')

  # postcss-modules
  # PostCSS plugin to use CSS Modules everywhere
  # https://github.com/css-modules/postcss-modules
  modules+=('postcss-modules')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  modules+=('postcss-reporter')

  yarn add --dev "${modules[@]}"

  # cp "$1/.postcssrc" .
  cp "$1/postcss.config.js" .
}
