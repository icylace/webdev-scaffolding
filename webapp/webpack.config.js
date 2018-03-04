"use strict"

// Some parts borrowed from:
// https://medium.com/webpack/predictable-long-term-caching-with-webpack-d3eee1d3fa31

// TODO (2017-07-20):  Keep track of this imagemin-webpack-plugin issue:
// https://github.com/Klathmon/imagemin-webpack-plugin/issues/22

// TODO (2017-07-19):  The webpack runtime gets inlined into our HTML that's
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

// Other Webpack plugins.
const BundleAnalyzerPlugin = require("webpack-bundle-analyzer").BundleAnalyzerPlugin
const CleanPlugin = require("clean-webpack-plugin")
const CopyPlugin = require("copy-webpack-plugin")
const ExtractTextPlugin = require("extract-text-webpack-plugin")
const NameAllModulesPlugin = require("name-all-modules-plugin")

function setupWebpack(env = {}) {
  const inProduction = process.env.NODE_ENV === "production"
  const extractedStyles = new ExtractTextPlugin(inProduction ? "[name].[chunkhash].css" : "[name].css")
  return {
    entry: {
      main: [...(inProduction ? [] : ["webpack-hot-middleware/client", "webpack/hot/dev-server"]), "./src/main.js"],
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
          test: /\.(gif|jpe?g|png|svg)$/i,
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
        {
          test: /\.jsx?$/,
          loader: "babel-loader",
          exclude: /node_modules/,
        },
        {
          test: /\.vue$/,
          loader: "vue-loader",
          options: { extractCSS: extractedStyles },
        },
      ],
    },
    resolve: {
      alias: { vue$: "vue/dist/vue.common.js" },
    },
    devServer: {
      historyApiFallback: true,
      noInfo: true,
    },
    performance: { hints: inProduction ? "warning" : false },
    devtool: inProduction ? "hidden-source-map" : "cheap-module-eval-source-map",
    plugins: [
      new CleanPlugin(["dist"], process.env.CLEANING_ALL ? {} : { exclude: ["icons", "images"] }),
      new webpack.optimize.ModuleConcatenationPlugin(),
      new webpack.NamedModulesPlugin(),
      new webpack.NamedChunksPlugin(
        chunk => chunk.name || chunk.modules.map(it => path.relative(it.context, it.request)).join("_"),
      ),
      new webpack.optimize.CommonsChunkPlugin({
        name: "vendor",
        minChunks: Infinity,
      }),
      new webpack.optimize.CommonsChunkPlugin({ name: "runtime" }),
      new InlineChunksPlugin({ inlineChunks: ["runtime"], deleteFile: true }),
      new NameAllModulesPlugin(),
      extractedStyles,
      new HtmlPlugin({
        title: "YESLint",
        template: "src/index.ejs",
      }),
      new FaviconsPlugin({
        logo: "./src/assets/icons/logo-template.png",
        prefix: "icons/[hash]/",
        background: "#000000",
      }),
      new CopyPlugin([{ from: "src/assets/root", to: "[name].[ext]" }]),
      // Make sure `ImageminPlugin` is after any plugins that add images.
      new ImageminPlugin({
        disable: !inProduction,
        optipng: { optimizationLevel: 5 },
        gifsicle: { interlaced: true },
        jpegtran: { progressive: true },
      }),
      ...(inProduction
        ? [
            new webpack.EnvironmentPlugin({ NODE_ENV: "production" }),
            new webpack.optimize.UglifyJsPlugin({ extractComments: true }),
            new SriPlugin({ hashFuncNames: ["sha256", "sha384"] }),
            // Our standard compression will be done with Brotli but we'll also do
            // gzip compression as a fallback.  Also, considered suggestions from:
            // https://www.fastly.com/blog/new-gzip-settings-and-deciding-what-compress/
            // http://www.itworld.com/article/2693941/cloud-computing/why-it-doesn-t-make-sense-to-gzip-all-content-from-your-web-server.html
            new BrotliPlugin({
              // We're inlining the webpack runtime code, so skip trying
              // to compress "runtime.js".
              test: /^(?!runtime).*\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
              threshold: 1400,
            }),
            new CompressionPlugin({
              test: /^(?!runtime).*\.(css|eot|html|ico|js|json|otf|svg|ttf)$/,
              threshold: 1400,
            }),
          ]
        : [new webpack.HotModuleReplacementPlugin()]),
      ...(process.env.ANALYZING ? [new BundleAnalyzerPlugin()] : []),
    ],
  }
}

module.exports = setupWebpack
