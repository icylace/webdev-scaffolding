#!/usr/bin/env bash

# $1 = Directory for webpack base settings.
setup_webpack_base() {
  cp "$1/base.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/base.js"))' >> ./webpack.config.js/setters.js
}
