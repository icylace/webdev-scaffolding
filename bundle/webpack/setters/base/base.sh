#!/usr/bin/env bash

setup_webpack_base() {
  cp "$WEBDEV_BUNDLE/webpack/setters/base/base.js" ./webpack.config.js/setters

  echo 'module.exports.push(require("./setters/base.js"))' >> ./webpack.config.js/setters.js
}
