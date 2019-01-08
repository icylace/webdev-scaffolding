"use strict"

const path = require("path")

const CleanPlugin = require("clean-webpack-plugin")

const cleaningSetup = () => ({
  plugins: [
    new CleanPlugin(["./dist"], {
      // exclude: inProduction ? [] : ["icons", "images"],
      // root: path.resolve(__dirname, settings.paths.dist.base),
      root: path.resolve(__dirname, ".."),
    }),
  ],
})

module.exports = cleaningSetup
