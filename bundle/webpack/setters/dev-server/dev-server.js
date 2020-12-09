"use strict"

const webpack = require("webpack")

module.exports = (inProduction) => {
  const settings = {
    devServer: {
      // compress: true,
      // contentBase: path.join(__dirname, "dist"),
      historyApiFallback: true,
      hotOnly: true,
      https: true,
      inline: true,
      // noInfo: true,
      // port: 9000,
      // proxy: {
      //   "/api": "http://localhost:3000",
      // },
      publicPath: "/",
      openPage: "/",
      stats: "normal",
      overlay: {
        warnings: true,
        errors: true,
      },
    },
  }

  if (!inProduction) {
    settings.plugins = [new webpack.HotModuleReplacementPlugin()]
  }

  return settings
}
