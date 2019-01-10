"use strict"

const path = require("path")

const baseSetup = inProduction => ({
  // devtool: inProduction ? "hidden-source-map" : "cheap-module-eval-source-map",
  devtool: inProduction ? "source-map" : "inline-source-map",
  mode: inProduction ? "production" : "development",
  module: { rules: [] },
  plugins: [],
  stats: "normal",
  entry: {
    main: "./src/client/index.js",
    // vendor: "./src/client/vendor.js",
  },
  output: {
    path: path.resolve(__dirname, "..", "dist"),
    filename: inProduction ? "[name].[chunkhash].js" : "[name].js",
    publicPath: "/",
    crossOriginLoading: "anonymous",
  },
  resolve: {
    extensions: [".js"],
  },
})

module.exports = baseSetup
