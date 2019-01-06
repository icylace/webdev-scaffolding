"use strict"

const purescriptSetup = _ => ({
  resolve: {
    extensions: [".purs"],
  },
  module: {
    rules: [
      {
        test: /\.purs?$/,
        loader: "purs-loader",
        exclude: /node_modules/,
        bundleOutput: "tmp/purescriptOutput.js",
      },
    ],
  },
})

module.exports = [purescriptSetup]
