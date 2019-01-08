"use strict"

const BrotliPlugin = require("brotli-webpack-plugin")
const CompressionPlugin = require("compression-webpack-plugin")
const ImageminPlugin = require("imagemin-webpack-plugin").default

const compressionSetup = inProduction => {
  // Make sure `ImageminPlugin` is after copy-webpack-plugin and any plugins
  // that add images.
  const settings = {
    plugins: [
      new ImageminPlugin({
        disable: !inProduction,
        optipng: { optimizationLevel: 5 },
        gifsicle: { interlaced: true },
        jpegtran: { progressive: true },
      }),
    ],
  }

  if (inProduction) {
    const compressionOptions = {
      // We're inlining the webpack runtime code, so skip trying
      // to compress "runtime.js".
      // test: /^(?!runtime).*\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
      test: /\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
      threshold: 1400,
    }

    // Our standard compression will be done with Brotli but we'll also do
    // gzip compression as a fallback.  Also, considered suggestions from:
    // https://www.fastly.com/blog/new-gzip-settings-and-deciding-what-compress/
    // http://www.itworld.com/article/2693941/cloud-computing/why-it-doesn-t-make-sense-to-gzip-all-content-from-your-web-server.html
    settings.plugins.push(new BrotliPlugin(compressionOptions))
    settings.plugins.push(new CompressionPlugin(compressionOptions))
  }

  return settings
}

module.exports = compressionSetup
