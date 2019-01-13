#!/usr/bin/env bash

setup_postcss() {
  local modules=()

  # PostCSS
  # A tool for transforming CSS with JavaScript
  # http://postcss.org/
  modules+=('postcss')

  # PostCSS CLI
  # CLI for postcss
  # https://github.com/postcss/postcss-cli
  modules+=('postcss-cli')

  # postcss-import
  # A PostCSS plugin to inline `@import` rules content.
  # https://github.com/postcss/postcss-import
  modules+=('postcss-import')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  modules+=('postcss-reporter')

  # ----------------------------------------------------------------------------

  # cssnano
  # A modular minifier, built on top of the PostCSS ecosystem.
  # https://cssnano.co/
  modules+=('cssnano')

  # TODO:
  # # PostCSS Colorblind Plugin
  # # A PostCSS plugin for seeing your site as a colorblind person may.
  # # https://github.com/btholt/postcss-colorblind
  # modules+=('postcss-colorblind')

  # postcss-modules
  # PostCSS plugin to use CSS Modules everywhere
  # https://github.com/css-modules/postcss-modules
  modules+=('postcss-modules')

  # PostCSS Preset Env
  # Use tomorrow’s CSS today.
  # https://preset-env.cssdb.org/
  modules+=('postcss-preset-env')

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/postcss/postcss.config.js" .

  # TODO:
  local tmp="$(mktemp)"
  jq '.scripts += {
    "build:css": "npx postcss"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
