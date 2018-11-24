#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # webpack
  # A static module bundler for modern JavaScript applications.
  # https://webpack.js.org/
  # https://webpack.js.org/api/cli/
  yarn add --dev webpack
  yarn add --dev webpack-cli

  # ----------------------------------------------------------------------------

  cp "$1/webpack/webpack.config.js" .

  local tmp="$(mktemp)"
  jq '.scripts += { start: "webpack --config webpack.config.js" }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
