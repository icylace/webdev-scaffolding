// TODO:

"use strict"

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
//
// https://stackoverflow.com/a/45194798/1935675

// TODO
// - color audit
// - server-side rendering
// - performance audit
// - accessibility audit

const path = require("path")
const webpack = require("webpack")

// HTML Webpack Plugin and plugins for it.
const FaviconsPlugin = require("favicons-webpack-plugin")
const HtmlPlugin = require("html-webpack-plugin")
const InlineChunksPlugin = require("inline-chunks-html-webpack-plugin")
const SriPlugin = require("webpack-subresource-integrity")

// Asset compression plugins.
const BrotliPlugin = require("brotli-webpack-plugin")
const CompressionPlugin = require("compression-webpack-plugin")
const ImageminPlugin = require("imagemin-webpack-plugin").default
const UglifyJSPlugin = require("uglifyjs-webpack-plugin")

// Other Webpack plugins.
const BundleAnalyzerPlugin = require("webpack-bundle-analyzer").BundleAnalyzerPlugin
const CleanPlugin = require("clean-webpack-plugin")
const CopyPlugin = require("copy-webpack-plugin")
const ExtractTextPlugin = require("extract-text-webpack-plugin")

const inProduction = process.env.NODE_ENV === "production"

// -----------------------------------------------------------------------------

// https://medium.com/webpack/predictable-long-term-caching-with-webpack-d3eee1d3fa31

const NameAllModulesPlugin = require("name-all-modules-plugin")

function predictableLongTermCachingSetup() {
  return [
    new webpack.NamedModulesPlugin(),
    new webpack.NamedChunksPlugin(
      chunk => chunk.name || chunk.modules.map(m => path.relative(m.context, m.request)).join("_"),
    ),
    new webpack.optimize.CommonsChunkPlugin({
      name: "vendor",
      minChunks: Infinity,
    }),
    new webpack.optimize.CommonsChunkPlugin({ name: "runtime" }),
    new NameAllModulesPlugin(),
  ]
}

// -----------------------------------------------------------------------------

function compressionSetup() {
  const compressionOptions = {
    // We're inlining the webpack runtime code, so skip trying
    // to compress "runtime.js".
    test: /^(?!runtime).*\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
    threshold: 1400,
  }
  return [
    // Make sure `ImageminPlugin` is after any plugins that add images.
    new ImageminPlugin({
      disable: !inProduction,
      optipng: { optimizationLevel: 5 },
      gifsicle: { interlaced: true },
      jpegtran: { progressive: true },
    }),
    ...(inProduction
      ? [
          // Our standard compression will be done with Brotli but we'll also do
          // gzip compression as a fallback.  Also, considered suggestions from:
          // https://www.fastly.com/blog/new-gzip-settings-and-deciding-what-compress/
          // http://www.itworld.com/article/2693941/cloud-computing/why-it-doesn-t-make-sense-to-gzip-all-content-from-your-web-server.html
          new BrotliPlugin(compressionOptions),
          new CompressionPlugin(compressionOptions),
        ]
      : []),
  ]
}

// -----------------------------------------------------------------------------

function setupWebpack() {
  const extractedStyles = new ExtractTextPlugin(inProduction ? "[name].[chunkhash].css" : "[name].css")
  return {
    entry: {
      main: [
        ...(inProduction ? [] : ["webpack-hot-middleware/client", "webpack/hot/dev-server"]),
        "./src/client/main.ts",
      ],
      vendor: ["vue", "vue-router", "vuex"],
    },
    output: {
      path: path.resolve(__dirname, "dist"),
      filename: inProduction ? "[name].[chunkhash].js" : "[name].js",
      publicPath: "/",
      crossOriginLoading: "anonymous",
    },
    module: {
      rules: [
        {
          test: /\.css$/,
          use: extractedStyles.extract({
            use: ["css-loader", "postcss-loader"],
            fallback: "style-loader",
          }),
        },
        {
          test: /\.(eot|svg|ttf|woff2?)(\?\S*)?$/,
          loader: "file-loader",
        },
        {
          test: /\.(gif|jpe?g|png|svg)(\?\S*)?$/,
          use: [
            {
              loader: "url-loader",
              options: {
                limit: inProduction ? 5000 : -1,
                name: "images/[name].[ext]?[hash]",
              },
            },
          ],
        },
        // {
        //   test: /\.jsx?$/,
        //   loader: "babel-loader",
        //   exclude: /node_modules/,
        // },
        // {
        //   test: /\.tsx?$/,
        //   loader: "ts-loader",
        //   options: { appendTsSuffixTo: [/\.vue$/] },
        // },
        // {
        //   test: /\.vue$/,
        //   loader: "vue-loader",
        //   options: {
        //     extractCSS: extractedStyles,
        //     loaders: {
        //       ts: {
        //         loader: "ts-loader",
        //         options: { configFile: "./src/client/tsconfig.json" },
        //       },
        //     },
        //   },
        // },
      ],
    },
    resolve: {
      extensions: ["*", ".js", ".json"],
      // extensions: ["*", ".ts", ".tsx", ".js", ".json", ".jsx", ".vue"],
      // Uncomment the `alias` line if the template compiler
      // is necessary during runtime.
      // https://vuejs.org/v2/guide/installation.html#Runtime-Compiler-vs-Runtime-only
      // alias: { "vue$": "vue/dist/vue.esm.js" },
    },
    devServer: {
      historyApiFallback: true,
      noInfo: true,
    },
    performance: { hints: inProduction ? "warning" : false },
    devtool: inProduction ? "hidden-source-map" : "cheap-module-eval-source-map",
    // (?) devtool: "source-map" | "inline-source-map",
    // stats: "detailed",
    plugins: [
      new CleanPlugin(["./dist"], process.env.CLEANING_ALL ? {} : { exclude: ["icons", "images"] }),
      new webpack.optimize.ModuleConcatenationPlugin(),
      ...predictableLongTermCachingSetup(),
      new InlineChunksPlugin({
        inlineChunks: ["runtime"],
        deleteFile: true,
      }),
      extractedStyles,
      new HtmlPlugin({
        title: "YESLint",
        template: "./src/client/index.ejs",
      }),
      new FaviconsPlugin({
        logo: "./src/client/assets/icons/logo-template.png",
        prefix: "icons/[hash]/",
        background: "#000000",
      }),
      new CopyPlugin([
        {
          from: "./src/client/assets/root",
          to: "[name].[ext]",
        },
      ]),
      ...compressionSetup(),
      ...(inProduction
        ? [
            new webpack.EnvironmentPlugin({ NODE_ENV: "production" }),
            // new webpack.optimize.UglifyJsPlugin({ extractComments: true }),
            new UglifyJSPlugin({ extractComments: true }),
            new SriPlugin({ hashFuncNames: ["sha256", "sha384"] }),
          ]
        : []),
      ...(!inProduction ? [new webpack.HotModuleReplacementPlugin()] : []),
      ...(process.env.ANALYZING ? [new BundleAnalyzerPlugin()] : []),
    ],
  }
}

module.exports = setupWebpack
