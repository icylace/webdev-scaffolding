"use strict"

const cssSetup = inProduction => ({
  module: {
    rules: [
      {
        test: /\.p?css$/,
        use: [
          {
            loader: "style-loader",
          },
          {
            loader: "css-loader",
            options: {
              importLoaders: 2,
              sourceMap: !inProduction,
            },
          },
          {
            loader: "resolve-url-loader",
          },
          {
            loader: "postcss-loader",
            options: {
              sourceMap: inProduction ? false : "inline",
            },
          },
        ],
      },
    ],
  },
})

module.exports = cssSetup
