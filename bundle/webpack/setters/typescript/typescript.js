"use strict"

const tsConfigPaths = require("tsconfig-paths-webpack-plugin")

module.exports = () => ({
  resolve: {
    extensions: [".ts", ".tsx"],
    plugins: [new tsConfigPaths()],
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        enforce: "pre",
        loader: "tslint-loader",
      },
      {
        test: /\.tsx?$/,
        loader: "awesome-typescript-loader",
      },
    ],
  },
})
