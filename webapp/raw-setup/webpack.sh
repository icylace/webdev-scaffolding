#!/usr/bin/env bash

#
# Sets up the build system available to all projects.
#
setup_base_webpack() {
  local devFirstModules=()
  local devModules=()

  # Webpack Bundle Analyzer
  # ebpack plugin and CLI utility that represents bundle content as convenient
  # interactive zoomable treemap
  # https://github.com/th0r/webpack-bundle-analyzer
  devModules+=('webpack-bundle-analyzer')

  # ----------------------------------------------------------------------------
  #  Task running and bundling
  # ----------------------------------------------------------------------------

  # brotli plugin for webpack
  # Prepare Brotli-compressed versions of assets to serve them
  # with Content-Encoding: br
  # https://github.com/mynameiswhm/brotli-webpack-plugin
  devModules+=('brotli-webpack-plugin')

  # Clean for webpack
  # A webpack plugin to remove/clean your build folder(s) before building.
  # https://github.com/johnagan/clean-webpack-plugin
  devModules+=('clean-webpack-plugin')

  # CompressionWebpackPlugin
  # Prepare compressed versions of assets to serve them with `Content-Encoding`.
  # https://github.com/webpack-contrib/compression-webpack-plugin
  devModules+=('compression-webpack-plugin')

  # Copy Webpack Plugin
  # Copy files and directories in webpack
  # https://github.com/kevlened/copy-webpack-plugin
  devModules+=('copy-webpack-plugin')

  # Extract Text Plugin
  # Puts text into a separate file.
  # https://github.com/webpack-contrib/extract-text-webpack-plugin
  devModules+=('extract-text-webpack-plugin')

  # Favicons Webpack Plugin
  # Let webpack generate all your favicons and icons for you
  # https://github.com/jantimon/favicons-webpack-plugin
  devModules+=('favicons-webpack-plugin')

  # # Friendly-errors-webpack-plugin
  # # Recognizes certain classes of webpack errors and cleans, aggregates
  # # and prioritizes them to provide a better Developer Experience.
  # # https://github.com/geowarin/friendly-errors-webpack-plugin
  # devModules+=('friendly-errors-webpack-plugin')

  # HTML Webpack Plugin
  # Simplifies creation of HTML files to serve your webpack bundles
  # https://github.com/jantimon/html-webpack-plugin
  devModules+=('html-webpack-plugin')

  # Imagemin plugin for Webpack
  # https://github.com/Klathmon/imagemin-webpack-plugin
  devModules+=('imagemin-webpack-plugin')

  # Inline Chunks Webpack Plugin
  # webpack plugin to inline chunks in html webpack plugin
  # https://github.com/Meatloose/inline-chunks-html-webpack-plugin
  devModules+=('inline-chunks-html-webpack-plugin')

  # name-all-modules-plugin
  # Names all remaining modules that do not get named via NamedModulesPlugin
  # https://github.com/timse/name-all-modules-plugin
  # https://medium.com/webpack/predictable-long-term-caching-with-webpack-d3eee1d3fa31
  devModules+=('name-all-modules-plugin')

  # UglifyJS Webpack Plugin
  # This plugin uses UglifyJS v3 (`uglify-es`) to minify your JavaScript
  # https://github.com/webpack-contrib/uglifyjs-webpack-plugin
  devModules+=('uglifyjs-webpack-plugin')

  # webpack
  # Bundler for the front end.
  # https://webpack.js.org/
  devFirstModules+=('webpack')

  # webpack Dev Middleware
  # A middleware wrapper for webpack.
  # https://github.com/webpack/webpack-dev-middleware
  devModules+=('webpack-dev-middleware')

  # # webpack Dev Server
  # # Serves a webpack app. Updates the browser on changes.
  # # https://github.com/webpack/webpack-dev-server
  # devModules+=('webpack-dev-server')

  # Webpack Hot Middleware
  # Webpack hot reloading using only webpack-dev-middleware.
  # https://github.com/glenjamin/webpack-hot-middleware
  devModules+=('webpack-hot-middleware')

  # webpack-subresource-integrity
  # Webpack plugin for enabling Subresource Integrity.
  # https://github.com/waysact/webpack-subresource-integrity
  devModules+=('webpack-subresource-integrity')

  # ----------------------------------------------------------------------------
  #  webpack Loaders
  # ----------------------------------------------------------------------------

  # babel-loader
  # A webpack loader that transpiles JavaScript files using Babel.
  # https://github.com/babel/babel-loader
  devModules+=('babel-loader')

  # CSS Loader
  # A webpack loader that resolves the CSS commands `@import`
  # and `url()` like ES2015's `import`.
  # https://github.com/webpack-contrib/css-loader
  devFirstModules+=('css-loader')

  # File Loader
  # A webpack loader that emits files in the output directory
  # and returns the public URL.
  # https://github.com/webpack-contrib/file-loader
  devFirstModules+=('file-loader')

  # # HTML Loader
  # # A webpack loader that exports HTML as a string.
  # # https://github.com/webpack-contrib/html-loader
  # devModules+=('html-loader')

  # # htmllint-loader
  # # A webpack loader to use htmllint (http://htmllint.github.io/).
  # # https://github.com/TheBlackBolt/htmllint-loader
  # devModules+=('htmllint-loader')

  # image-loader
  # A webpack loader that optimizes images.
  # https://github.com/tcoopman/image-webpack-loader
  devModules+=('image-webpack-loader')

  # PostCSS for Webpack
  # A webpack loader to use PostCSS.
  # https://github.com/postcss/postcss-loader
  devModules+=('postcss-loader')

  # Style Loader
  # A webpack loader that adds CSS to the DOM by injecting a `<style>` tag.
  # https://github.com/webpack-contrib/style-loader
  devModules+=('style-loader')

  # Url Loader
  # Works like file-loader but can return a data URL if the file
  # is smaller than a byte limit.
  # https://github.com/webpack-contrib/url-loader
  devModules+=('url-loader')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
}
