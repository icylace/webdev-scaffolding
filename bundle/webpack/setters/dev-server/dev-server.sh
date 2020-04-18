#!/usr/bin/env bash

setup_webpack_dev_server() {
  local modules=()

  # webpack-dev-server
  # Serves a webpack app. Updates the browser on changes.
  # https://github.com/webpack/webpack-dev-server
  # https://www.npmjs.com/package/webpack-dev-server
  modules+=('webpack-dev-server')

  # TODO:
  # # webpack-dev-middleware
  # # A development middleware for webpack
  # # https://github.com/webpack/webpack-dev-middleware
  # # https://www.npmjs.com/package/webpack-dev-middleware
  # modules+=('webpack-dev-middleware')

  # TODO:
  # # Webpack Hot Middleware
  # # Webpack hot reloading you can attach to your own server
  # # https://github.com/webpack-contrib/webpack-hot-middleware
  # # https://www.npmjs.com/package/webpack-hot-middleware
  # modules+=('webpack-hot-middleware')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/dev-server/dev-server.js" ./webpack.config.js/setters

  echo 'dev-server' >> ./webpack.config.js/setters.js

  update_json '.scripts += {
    serve: "webpack-dev-server --color --progress"
  }' ./package.json
}
