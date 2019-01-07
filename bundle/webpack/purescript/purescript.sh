#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack_purescript() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  local modules=()

  # purs-loader
  # PureScript loader for webpack
  # https://github.com/ethul/purs-loader
  modules+=('purs-loader')

  yarn add --dev "${modules[@]}"

  cp "$1/webpack/purescript/purescript.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/purescript.js"))' >> ./webpack.config.js/setters.js
}
