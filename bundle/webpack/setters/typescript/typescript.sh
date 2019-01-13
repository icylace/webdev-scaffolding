#!/usr/bin/env bash

setup_webpack_typescript() {
  local modules=()

  # tslint-loader
  # Tslint loader for Webpack.
  # https://github.com/wbuchwalter/tslint-loader
  modules+=('tslint-loader')

  # TypeScript loader for Webpack
  # Awesome TypeScript loader for webpack
  # https://github.com/s-panferov/awesome-typescript-loader
  modules+=('awesome-typescript-loader')

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/webpack/setters/typescript/typescript.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/typescript.js"))' >> ./webpack.config.js/setters.js
}
