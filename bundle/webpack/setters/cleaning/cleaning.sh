#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_cleaning() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  local modules=()

  # Clean for WebPack
  # A webpack plugin to remove your build folder(s) before building
  # https://github.com/johnagan/clean-webpack-plugin
  modules+=('clean-webpack-plugin')

  yarn add --dev "${modules[@]}"

  cp "$1/webpack/setters/cleaning/cleaning.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/cleaning.js"))' >> ./webpack.config.js/setters.js
}
