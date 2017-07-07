#!/usr/bin/env bash

#
# Sets up CSS functionality available to all projects.
#
setup_base_css_system() {
  local devModules=()

  # CSS Stats
  # Gathers statistics on CSS usage.
  # http://cssstats.com/
  devModules+=('cssstats')

  # ----------------------------------------------------------------------------
  #  Transpilation
  # ----------------------------------------------------------------------------

  # cssnano
  # Minifies CSS.
  # http://cssnano.co/
  devModules+=('cssnano')

  # PostCSS
  # Processes CSS using plugins.
  # http://postcss.org/
  devModules+=('postcss')

  # PostCSS-cssnext
  # A PostCSS plugin to use the latest CSS.
  # http://cssnext.io/
  devModules+=('postcss-cssnext')

  # postcss-import
  # A PostCSS plugin to inline `@import` rules content.
  # https://www.npmjs.com/package/postcss-import
  devModules+=('postcss-import')

  # PostCSS for Webpack
  # A webpack loader to use PostCSS.
  # https://www.npmjs.com/package/postcss-loader
  devModules+=('postcss-loader')

  # PostCSS Mixins
  # A PostCSS plugin to use mixins.
  # https://www.npmjs.com/package/postcss-mixins
  devModules+=('postcss-mixins')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://www.npmjs.com/package/postcss-reporter
  devModules+=('postcss-reporter')

  # postcss-stats-reporter
  # Prints stats from cssstats.
  # https://www.npmjs.com/package/postcss-stats-reporter
  devModules+=('postcss-stats-reporter')

  # ----------------------------------------------------------------------------
  #  Linting
  # ----------------------------------------------------------------------------

  # stylelint
  # Checks the style of CSS code.
  # http://stylelint.io/
  devModules+=('stylelint')

  # stylelint-processor-html
  # An stylelint plugin that extracts and lints styles from HTML files.
  # https://github.com/ccbikai/stylelint-processor-html
  devModules+=('stylelint-processor-html')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devModules[@]}"
}


#
# Sets up JavaScript functionality available to all projects.
#
# TODO:
# - incorporate babel-preset-env as mentioned in: http://www.2ality.com/2017/02/babel-preset-env.html
#
setup_base_javascript_system() {
  local devFirstModules=()
  local devModules=()

  # ----------------------------------------------------------------------------
  #  Transpilation
  # ----------------------------------------------------------------------------

  # Babel
  # Converts JavaScript of the future to the JavaScript of today.
  # https://babeljs.io/
  devFirstModules+=('babel-core')

  # babel-eslint
  # A parser for ESLint that lets it process Babel code.
  # https://www.npmjs.com/package/babel-eslint
  devModules+=('babel-eslint')

  # # babel-plugin-flow-runtime
  # # A Babel plugin to use flow-runtime.
  # # https://codemix.github.io/flow-runtime/#/babel-plugin-flow-runtime
  # devModules+=('babel-plugin-flow-runtime')

  # # Babel Legacy Decorator plugin
  # # A plugin for Babel 6 that (mostly) replicates the old decorator
  # # behavior from Babel 5.
  # # https://github.com/loganfsmyth/babel-plugin-transform-decorators-legacy
  # devModules+=('babel-plugin-transform-decorators-legacy')

  # # babel-plugin-transform-flow-comments
  # # https://babeljs.io/docs/plugins/transform-flow-comments/
  # # https://github.com/babel/babel/tree/master/packages/babel-plugin-transform-flow-comments
  # devModules+=('babel-plugin-transform-flow-comments')

  # babel-preset-latest
  # A special Babel preset that contains all yearly presets for convenience.
  # https://babeljs.io/docs/plugins/preset-latest/
  devModules+=('babel-preset-latest')

  # ----------------------------------------------------------------------------
  #  Linting
  # ----------------------------------------------------------------------------

  # ESLint
  # Checks the style of JavaScript code.
  # http://eslint.org/
  devFirstModules+=('eslint')

  # eslint-plugin-ava
  # ESLint rules for AVA.
  # https://github.com/avajs/eslint-plugin-ava
  devModules+=('eslint-plugin-ava')

  # eslint-plugin-flowtype
  # ESLint rules for Flow.
  # https://github.com/gajus/eslint-plugin-flowtype
  devModules+=('eslint-plugin-flowtype')

  # eslint-plugin-flowtype-errors
  # Retrieves Flow errors as ESLint errors.
  # https://github.com/amilajack/eslint-plugin-flowtype-errors
  devModules+=('eslint-plugin-flowtype-errors')

  # eslint-plugin-html
  # An ESLint plugin that extracts and lints scripts from HTML files.
  # https://github.com/BenoitZugmeyer/eslint-plugin-html
  devModules+=('eslint-plugin-html')

  # ----------------------------------------------------------------------------
  #  Type checking
  # ----------------------------------------------------------------------------

  # Flow
  # A static type checker for JavaScript.
  # https://flowtype.org/
  devFirstModules+=('flow-bin')

  # # flow-runtime
  # # Flow-compatible runtime type system for JavaScript.
  # # https://codemix.github.io/flow-runtime/#/
  # devModules+=('flow-runtime')

  # ----------------------------------------------------------------------------
  #  Testing
  # ----------------------------------------------------------------------------

  # AVA
  # A test runner.
  # https://github.com/avajs
  devModules+=('ava')

  # nyc
  # The CLI interface for Istanbul.
  # https://istanbul.js.org/
  devModules+=('nyc')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
  # flow init
  # eslint --init
}


#
# Sets up the build system available to all projects.
#
setup_build_system() {
  local devFirstModules=()
  local devModules=()

  # cross-env
  # Sets environment variables in a cross-platform way.
  # https://www.npmjs.com/package/cross-env
  devModules+=('cross-env')

  # ----------------------------------------------------------------------------
  #  Task running and bundling
  # ----------------------------------------------------------------------------

  # Clean for webpack
  # A webpack plugin to remove/clean your build folder(s) before building.
  # https://github.com/johnagan/clean-webpack-plugin
  devModules+=('clean-webpack-plugin')

  # CompressionWebpackPlugin
  # Prepare compressed versions of assets to serve them with `Content-Encoding`.
  # https://www.npmjs.com/package/compression-webpack-plugin
  devModules+=('compression-webpack-plugin')

  # Extract Text Plugin
  # Puts text into a separate file.
  # https://github.com/webpack-contrib/extract-text-webpack-plugin
  devModules+=('extract-text-webpack-plugin')

  # # HTML Webpack Plugin
  # # A webpack plugin that simplifies the creation of HTML files
  # # to serve your webpack bundles.
  # # https://github.com/jantimon/html-webpack-plugin
  # devModules+=('html-webpack-plugin')

  # webpack
  # Bundler for the front-end.
  # https://webpack.js.org/
  devFirstModules+=('webpack')

  # webpack Dev Middleware
  # A middleware wrapper for webpack.
  # https://www.npmjs.com/package/webpack-dev-middleware
  devModules+=('webpack-dev-middleware')

  # Webpack Hot Middleware
  # Webpack hot reloading using only webpack-dev-middleware.
  # https://www.npmjs.com/package/webpack-hot-middleware
  devModules+=('webpack-hot-middleware')

  # ----------------------------------------------------------------------------
  #  webpack Loaders
  # ----------------------------------------------------------------------------

  # babel-loader
  # A webpack loader that transpiles JavaScript files using Babel.
  # https://www.npmjs.com/package/babel-loader
  devModules+=('babel-loader')

  # CSS Loader
  # A webpack loader that resolves the CSS commands `@import`
  # and `url()` like ES2015's `import`.
  # https://www.npmjs.com/package/css-loader
  devFirstModules+=('css-loader')

  # File Loader
  # A webpack loader that emits files in the output directory
  # and returns the public URL.
  # https://www.npmjs.com/package/file-loader
  devFirstModules+=('file-loader')

  # # HTML Loader
  # # A webpack loader that exports HTML as a string.
  # # https://github.com/webpack-contrib/html-loader
  # devModules+=('html-loader')

  # # htmllint-loader
  # # A webpack loader to use htmllint (http://htmllint.github.io/).
  # # https://www.npmjs.com/package/htmllint-loader
  # devModules+=('htmllint-loader')

  # image-loader
  # A webpack loader that optimizes images.
  # https://github.com/tcoopman/image-webpack-loader
  devModules+=('image-webpack-loader')

  # Style Loader
  # A webpack loader that adds CSS to the DOM by injecting a `<style>` tag.
  # https://github.com/webpack-contrib/style-loader
  devModules+=('style-loader')

  # Url Loader
  # Works like file-loader but can return a data URL if the file
  # is smaller than a byte limit.
  # https://www.npmjs.com/package/url-loader
  devModules+=('url-loader')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
}
