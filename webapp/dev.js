// @flow
"use strict"

// https://www.akawebdesign.com/2016/04/08/hot-reloading-react-webpack-express/

const webpack              = require("webpack")
const webpackDevMiddleware = require("webpack-dev-middleware")
const webpackHotMiddleware = require("webpack-hot-middleware")
const setupWebpack         = require("./webpack.config.js")

const devSetup = setupWebpack()
const packer   = webpack(devSetup)

function useWebpack(app/*: Object*/)/*: Object*/ {
  app.use(webpackDevMiddleware(packer, {
    publicPath: devSetup.output.publicPath,
    stats: {
      chunks: false,
      colors: true,
      "errors-only": true,
    },
  }))
  app.use(webpackHotMiddleware(packer, { log: console.log }))
  return app
}

module.exports = { useWebpack }
