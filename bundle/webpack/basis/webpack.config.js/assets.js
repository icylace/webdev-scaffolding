"use strict"

const CopyPlugin = require("copy-webpack-plugin")

const rootFilesSetup = _ => ({
  plugins: [
    new CopyPlugin([
      {
        from: "./src/client/assets/root",
        to: "[name].[ext]",
      },
    ]),
  ],
})

const imagesSetup = inProduction => ({
  module: {
    rules: [
      {
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
      },
    ],
  },
})

const fontsSetup = _ => ({
  module: {
    rules: [
      {
        test: /\.(eot|ttf|woff2?)(\?\S*)?$/,
        loader: "file-loader",
      },
    ],
  },
})

module.exports = [rootFilesSetup, imagesSetup, fontsSetup]
