// TODO: (2017-07-25) HMR isn't perfect but it seems to work for now.
// Try to improve it.

// TODO: (2017-07-20) Keep track of this imagemin-webpack-plugin issue:
// https://github.com/Klathmon/imagemin-webpack-plugin/issues/22

// TODO: (2017-07-19) The webpack runtime gets inlined into our HTML that's
// generated from html-webpack-plugin but the `<script>` tag for the inlined
// JavaScipt gets the `integrity` and `crossorigin` attributes that are
// generated from webpack-subresource-integrity.  These attributes are
// useless for inlined JavaScript.  I should find a way to remove
// these attributes from the inlined code.
// https://stackoverflow.com/a/45194798

// TODO:
// - color audit
// - server-side rendering
// - performance audit
// - accessibility audit

"use strict"

const path = require("path")
const merge = require("webpack-merge")

const webpackSetters = require("./setters.js")

module.exports = (env, argv) => {
  const inProduction = argv.mode === "production"

  const baseSettings = {
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
  }

  const optimizationSettings = {
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
  }

  // Settings for webpack-dev-server.
  // https://webpack.js.org/configuration/dev-server/
  const devServerSettings = {
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

  const settings = webpackSetters.reduce(
    (acc, f) => merge.smart(acc, f(inProduction)),
    merge(baseSettings, optimizationSettings, devServerSettings),
  )

  return settings
}

// https://github.com/webpack/webpack/issues/1315#issuecomment-386267369
// https://medium.com/webpack/predictable-long-term-caching-with-webpack-d3eee1d3fa31

// -----------------------------------------------------------------------------

// https://nystudio107.com/blog/an-annotated-webpack-4-config-for-frontend-web-development

// const configureManifest = fileName => {
//   return {
//     fileName: fileName,
//     basePath: settings.manifestConfig.basePath,
//     map: file => {
//       file.name = file.name.replace(/(\.[a-f0-9]{32})(\..*)$/, "$2")
//       return file
//     },
//   }
// }

// const baseConfig = {
//   name: pkg.name,
//   entry: configureEntries(),
//   output: {
//     path: path.resolve(__dirname, settings.paths.dist.base),
//     publicPath: settings.urls.publicPath(),
//   },
//   resolve: {
//     alias: {
//       vue$: "vue/dist/vue.esm.js",
//     },
//   },
//   module: {
//     rules: [configureVueLoader()],
//   },
//   plugins: [
//     new WebpackNotifierPlugin({ title: "Webpack", excludeWarnings: true, alwaysNotify: true }),
//     new VueLoaderPlugin(),
//   ],
// }

// const legacyConfig = {
//   module: {
//     rules: [configureBabelLoader(Object.values(pkg.browserslist.legacyBrowsers))],
//   },
//   plugins: [
//     new CopyWebpackPlugin(settings.copyWebpackConfig),
//     new ManifestPlugin(configureManifest("manifest-legacy.json")),
//   ],
// }

// const modernConfig = {
//   module: {
//     rules: [configureBabelLoader(Object.values(pkg.browserslist.modernBrowsers))],
//   },
//   plugins: [new ManifestPlugin(configureManifest("manifest.json"))],
// }

// // Common module exports.
// module.exports = {
//   legacyConfig: merge(legacyConfig, baseConfig),
//   modernConfig: merge(modernConfig, baseConfig),
// }

// Tip on using a folder named "webpack.config.js":
// https://nystudio107.com/blog/an-annotated-webpack-4-config-for-frontend-web-development#comment-4175541286
