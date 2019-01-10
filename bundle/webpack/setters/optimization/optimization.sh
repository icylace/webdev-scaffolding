#!/usr/bin/env bash

# $1 = Directory for webpack optimization settings.
setup_webpack_optimization() {
  cp "$1/optimization.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/optimization.js"))' >> ./webpack.config.js/setters.js
}
