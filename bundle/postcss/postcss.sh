#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_postcss() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # PostCSS
  # Processes CSS using plugins.
  # http://postcss.org/
  yarn add --dev postcss

  # cssnano
  # cssnano takes your nicely formatted CSS and runs it through many focused
  # optimisations, to ensure that the final result is as small as possible
  # for a production environment.
  # https://cssnano.co/
  yarn add --dev cssnano

  # # PostCSS Colorblind Plugin
  # # A PostCSS plugin for seeing your site as a colorblind person may.
  # # https://github.com/btholt/postcss-colorblind
  # yarn add --dev postcss-colorblind

  # PostCSS-cssnext
  # A PostCSS plugin to use the latest CSS.
  # http://cssnext.io/
  yarn add --dev postcss-cssnext

  # postcss-import
  # A PostCSS plugin to inline `@import` rules content.
  # https://github.com/postcss/postcss-import
  yarn add --dev postcss-import

  # postcss-modules
  # PostCSS plugin to use CSS Modules everywhere
  # https://github.com/css-modules/postcss-modules
  yarn add --dev postcss-modules

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  yarn add --dev postcss-reporter

  # ----------------------------------------------------------------------------

  # cp "$1/postcss/.postcssrc" .
  cp "$1/postcss/postcss.config.js" .
}
