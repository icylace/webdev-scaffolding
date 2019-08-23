#!/usr/bin/env bash

setup_webpack_optimization() {
  cp "$WEBDEV_WEBPACK_SETTERS/optimization/optimization.js" ./webpack.config.js/setters

  echo 'optimization' >> ./webpack.config.js/setters.js
}
