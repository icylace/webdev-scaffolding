"use strict"

const optimizationSetup = inProduction => ({
  optimization: {
    splitChunks: {
      cacheGroups: {
        vendor: {
          chunks: "initial",
          name: "vendor",
          test: "vendor",
        },
      },
    },
  },
  performance: {
    hints: inProduction ? "warning" : false,
    maxEntrypointSize: 200000,
    maxAssetSize: 200000,
  },
})

module.exports = optimizationSetup
