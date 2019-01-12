#!/usr/bin/env bash

# $1 = Directory for webpack dev server settings.
setup_webpack_dev_server() {
  local modules=()

  # webpack-dev-server
  # Serves a webpack app. Updates the browser on changes.
  # https://github.com/webpack/webpack-dev-server
  modules+=('webpack-dev-server')

  # # webpack-dev-middleware
  # # A development middleware for webpack
  # # https://github.com/webpack/webpack-dev-middleware
  # modules+=('webpack-dev-middleware')

  # # Webpack Hot Middleware
  # # Webpack hot reloading you can attach to your own server
  # # https://github.com/webpack-contrib/webpack-hot-middleware
  # modules+=('webpack-hot-middleware')

  yarn add --dev "${modules[@]}"

  cp "$1/dev-server.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/dev-server.js"))' >> ./webpack.config.js/setters.js

  jq '.scripts += {
    serve: "npx webpack-dev-server --color --progress"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
