"use strict"

const path = require("path")

const { CleanWebpackPlugin } = require("clean-webpack-plugin")

module.exports = inProduction => ({
  // devtool: inProduction ? "hidden-source-map" : "cheap-module-eval-source-map",
  devtool: inProduction ? "source-map" : "inline-source-map",
  mode: inProduction ? "production" : "development",
  module: { rules: [] },
  plugins: [new CleanWebpackPlugin()],
  stats: "normal",
  entry: {
    main: "./src/index.js",
    // vendor: "./src/vendor.js",
  },
  output: {
    path: path.resolve(__dirname, "..", "..", "dist"),
    filename: inProduction ? "[name].[chunkhash].js" : "[name].js",
    publicPath: "/",
    crossOriginLoading: "anonymous",
  },
  resolve: {
    extensions: [".js"],
  },
})
