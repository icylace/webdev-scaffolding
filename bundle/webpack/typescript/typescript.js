"use strict"

const typescriptSetup = _ => ({
  resolve: {
    extensions: [".ts", ".tsx"],
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

module.exports = typescriptSetup
