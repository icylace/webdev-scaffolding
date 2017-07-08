// TODO
// - ensure CSS extraction to separate file works
// - image optimization
//   - url-loader afterwards ?
// - gzipping
// - Vue server-side rendering
// - chunking
// - accessibility auditing ?
// - w3c validation ?
// - color audit ?



// @flow
"use strict"

const path              = require("path")
const webpack           = require("webpack")
const CleanPlugin       = require("clean-webpack-plugin")
const CompressionPlugin = require("compression-webpack-plugin")
const ExtractTextPlugin = require("extract-text-webpack-plugin")
const extractStyles     = new ExtractTextPlugin("build.css")

function setupWebpack(env/*: Object*/ = {})/*: Object*/ {
  const inProduction = (process.env.NODE_ENV === "production")
  return {
    entry: (() => {
      if (inProduction) {
        return "./src/main.js"
      }
      return {
        main: [
          "webpack-hot-middleware/client",
          "webpack/hot/dev-server",
          "./src/main.js",
        ],
      }
    })(),
    output: {
      filename: "build.js",
      publicPath: "/",
      path: path.resolve(__dirname, "./dist"),
    },
    module: {
      rules: [
        {
          test: /\.css$/,
          use: [
            "style-loader",
            {
              loader: "css-loader",
              options: {
                importLoaders: 1,
                minimize: inProduction,
                sourceMap: inProduction,
              },
            },
            "postcss-loader",
          ],
        },
        {
          test: /\.(gif|jpg|png|svg)$/,
          loader: "url-loader",
          options: {
            limit: 5000,
            name: "[name].[ext]?[hash]",
          },
        },
        {
          test: /\.js$/,
          loader: "babel-loader",
          exclude: /node_modules/,
        },
        {
          test: /\.vue$/,
          loader: "vue-loader",
          options: {
            loaders: {
              css: extractStyles.extract({
                use: [
                  {
                    loader: "css-loader",
                    options: {
                      importLoaders: 1,
                      minimize: inProduction,
                      sourceMap: inProduction,
                    },
                  },
                  "postcss-loader",
                ],
                fallback: "vue-style-loader",
              }),
            },
          },
        },
      ],
    },
    resolve: {
      alias: { "vue$": "vue/dist/vue.common.js" },
    },
    devServer: {
      historyApiFallback: true,
      noInfo: true,
    },
    performance: (inProduction ? { hints: "warning" } : { hints: false }),
    devtool: (inProduction ? "hidden-source-map" : "cheap-module-eval-source-map"),
    target: "web",
    stats: {
      assets: true,
      colors: true,
      errorDetails: true,
      errors: true,
      hash: true,
    },
    plugins: (() => {
      if (inProduction) {
        return [
          new CleanPlugin(["dist/*.*"]),
          // new webpack.optimize.ModuleConcatenationPlugin(),
          extractStyles,
          new webpack.optimize.UglifyJsPlugin({
            // compress: { warnings: true },
            sourceMap: true,
          }),
          new webpack.DefinePlugin({ "process.env": { NODE_ENV: "'production'" } }),
          new CompressionPlugin(),
        ]
      }
      return [
        new CleanPlugin(["dist/*.*"]),
        // new webpack.optimize.ModuleConcatenationPlugin(),
        extractStyles,
        new webpack.HotModuleReplacementPlugin(),
      ]
    })(),
  }
}

module.exports = setupWebpack
