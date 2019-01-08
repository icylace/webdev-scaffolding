"use strict"

const webpack = require("webpack")

const hmrSetup = inProduction => {
  return inProduction ? {} : { plugins: [new webpack.HotModuleReplacementPlugin()] }
}

module.exports = hmrSetup
