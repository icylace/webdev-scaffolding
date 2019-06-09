"use strict"

const BrotliPlugin = require("brotli-webpack-plugin")
const CompressionPlugin = require("compression-webpack-plugin")

const ImageminPlugin = require("imagemin-webpack")
const imageminJpegtran = require("imagemin-jpegtran")
const imageminOptipng = require("imagemin-optipng")

module.exports = inProduction => {
  if (!inProduction) return

  const compressionOptions = {
    // We're inlining the webpack runtime code, so skip trying
    // to compress "runtime.js".
    // test: /^(?!runtime).*\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
    test: /\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
    threshold: 1400,
  }

  return {
    module: {
      rules: [
        // https://github.com/itgalaxy/imagemin-webpack
        {
          test: /\.(jpe?g|png|gif|svg)$/i,
          use: [
            {
              loader: "file-loader", // Or `url-loader` or your other loader
            },
          ],
        },
      ],
    },

    plugins: [
      // Make sure `ImageminPlugin` is after any plugins that add images, like
      // copy-webpack-plugin for example.
      new ImageminPlugin({
        cache: true,
        imageminOptions: {
          plugins: [
            imageminJpegtran({ progressive: true }),
            imageminOptipng({ optimizationLevel: 5 }),
          ],
        },
      }),

      // Our standard compression will be done with Brotli but we'll also do
      // gzip compression as a fallback.  Also, considered suggestions from:
      // https://www.fastly.com/blog/new-gzip-settings-and-deciding-what-compress/
      // http://www.itworld.com/article/2693941/cloud-computing/why-it-doesn-t-make-sense-to-gzip-all-content-from-your-web-server.html
      new BrotliPlugin(compressionOptions),
      new CompressionPlugin(compressionOptions),
    ],
  }
}
