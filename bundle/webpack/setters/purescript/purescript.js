"use strict"

module.exports = () => ({
  resolve: {
    extensions: [".purs"],
  },
  module: {
    rules: [
      {
        test: /\.purs?$/,
        loader: "purs-loader",
        exclude: /node_modules/,
        query: {
          bundleOutput: "tmp/purescriptOutput.js",
        },
      },
    ],
  },
})
