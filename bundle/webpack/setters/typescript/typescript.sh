#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_typescript() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

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

  cp "$1/webpack/setters/typescript/typescript.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/typescript.js"))' >> ./webpack.config.js/setters.js
}
