#!/usr/bin/env bash

setup_webpack_typescript() {
  local modules=()

  # tslint-loader
  # Tslint loader for Webpack.
  # https://github.com/wbuchwalter/tslint-loader
  # https://www.npmjs.com/package/tslint-loader
  modules+=('tslint-loader')

  # TypeScript loader for Webpack
  # Awesome TypeScript loader for webpack
  # https://github.com/s-panferov/awesome-typescript-loader
  # https://www.npmjs.com/package/awesome-typescript-loader
  modules+=('awesome-typescript-loader')

  # tsconfig-paths-webpack-plugin
  # Use this to load modules whose location is specified in the paths section
  # of tsconfig.json when using webpack.
  # https://www.npmjs.com/package/tsconfig-paths-webpack-plugin
  # https://www.npmjs.com/package/tsconfig-paths-webpack-plugin
  modules+=('tsconfig-paths-webpack-plugin')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_WEBPACK_SETTERS/typescript/typescript.js" ./webpack.config.js/setters

  echo 'typescript' >> ./webpack.config.js/setters.js
}
