#!/usr/bin/env bash

setup_postcss() {
  local devModules=()

  # cssnano
  # cssnano takes your nicely formatted CSS and runs it through many focused
  # optimisations, to ensure that the final result is as small as possible
  # for a production environment.
  # http://cssnano.co/
  devModules+=('cssnano')

  # PostCSS
  # Processes CSS using plugins.
  # http://postcss.org/
  devModules+=('postcss')

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

  # postcss-modules
  # PostCSS plugin to use CSS Modules everywhere
  # https://github.com/css-modules/postcss-modules
  devModules+=('postcss-modules')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  devModules+=('postcss-reporter')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/postcss"

  cp "$here/.postcssrc" .
}
