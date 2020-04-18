"use strict"

const CopyPlugin = require("copy-webpack-plugin")

const imagesRule = inProduction => ({
  test: /\.(gif|jpe?g|png|svg)(\?\S*)?$/,
  use: [
    {
      loader: "url-loader",
      options: {
        limit: inProduction ? -1 : 5000,
        name: "images/[name].[ext]?[hash]",
      },
    },
  ],
})

const fontsRule = {
  test: /\.(eot|ttf|woff2?)(\?\S*)?$/,
  loader: "file-loader",
}

module.exports = inProduction => ({
  plugins: [
    new CopyPlugin([
      {
        from: "./src/assets/root",
        to: "[name].[ext]",
      },
    ]),
  ],
  module: {
    rules: [imagesRule(inProduction), fontsRule],
  },
})
