#!/usr/bin/env bash

setup_webpack_optimization() {
  cp "$WEBDEV_BUNDLE/webpack/setters/optimization/optimization.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/optimization.js"))' >> ./webpack.config.js/setters.js
}
