#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_webpack() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  mkdir ./webpack.config.js
  mkdir ./tmp

  source "$1/webpack/basis/basis.sh"
  source "$1/webpack/compression/compression.sh"
  source "$1/webpack/css/css.sh"
  source "$1/webpack/html/html.sh"

  setup_webpack_basis "$1"
  setup_webpack_compression "$1"
  setup_webpack_css "$1"
  setup_webpack_html "$1"

  local tmp="$(mktemp)"
  jq '.scripts += {
    analyze: "npx webpack --profile --json > ./tmp/stats.json && npx webpack-bundle-analyzer ./tmp/stats.json",
    build: "npx webpack --mode production --progress",
    dev: "npx webpack --mode development --progress --watch",
    serve: "npx webpack-dev-server --color --progress"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json

  # ----------------------------------------------------------------------------

  # local modules=()

  # # webpack
  # # A static module bundler for modern JavaScript applications.
  # # https://webpack.js.org/
  # # https://webpack.js.org/api/cli/
  # modules+=('webpack')
  # modules+=('webpack-cli')

  # # webpack-dev-server
  # # Serves a webpack app. Updates the browser on changes.
  # # https://github.com/webpack/webpack-dev-server
  # modules+=('webpack-dev-server')

  # # webpack-dev-middleware
  # # A development middleware for webpack
  # # https://github.com/webpack/webpack-dev-middleware
  # modules+=('webpack-dev-middleware')

  # # Webpack Hot Middleware
  # # Webpack hot reloading you can attach to your own server
  # # https://github.com/webpack-contrib/webpack-hot-middleware
  # modules+=('webpack-hot-middleware')

  # # webpack-merge
  # # Merge designed for Webpack
  # # https://github.com/survivejs/webpack-merge
  # modules+=('webpack-merge')

  # ----------------------------------------------------------------------------

  # # Clean for WebPack
  # # A webpack plugin to remove your build folder(s) before building
  # # https://github.com/johnagan/clean-webpack-plugin
  # modules+=('clean-webpack-plugin')

  # ----------------------------------------------------------------------------

  # # Copy Webpack Plugin
  # # Copy files and directories in webpack
  # # https://github.com/kevlened/copy-webpack-plugin
  # modules+=('copy-webpack-plugin')

  # ----------------------------------------------------------------------------

  # # file-loader
  # # The file-loader resolves import/require() on a file into a url and emits the
  # # file into the output directory.
  # # https://github.com/webpack-contrib/file-loader
  # modules+=('file-loader')

  # ----------------------------------------------------------------------------

  # # brotli plugin for webpack
  # # Prepare Brotli-compressed versions of assets to serve them
  # # with Content-Encoding: br
  # # https://github.com/mynameiswhm/brotli-webpack-plugin
  # modules+=('brotli-webpack-plugin')

  # # compression-webpack-plugin
  # # Prepare compressed versions of assets to serve them with Content-Encoding
  # # https://github.com/webpack-contrib/compression-webpack-plugin
  # modules+=('compression-webpack-plugin')

  # # Imagemin plugin for Webpack
  # # Plugin to compress images with imagemin
  # # https://github.com/Klathmon/imagemin-webpack-plugin
  # modules+=('imagemin-webpack-plugin')

  # ----------------------------------------------------------------------------

  # # HTML Webpack Plugin
  # # Simplifies creation of HTML files to serve your webpack bundles
  # # https://github.com/jantimon/html-webpack-plugin
  # modules+=('html-webpack-plugin')

  # # Webapp Webpack Plugin
  # # Let webpack generate your progressive web app icons for you
  # # https://github.com/brunocodutra/webapp-webpack-plugin
  # modules+=('webapp-webpack-plugin')

  # # webpack-subresource-integrity
  # # Webpack plugin for enabling Subresource Integrity.
  # # https://github.com/waysact/webpack-subresource-integrity
  # modules+=('webpack-subresource-integrity')

  # ----------------------------------------------------------------------------

  # # css-loader
  # # The css-loader interprets @import and url() like import/require() and will
  # # resolve them.
  # # https://github.com/webpack-contrib/css-loader
  # modules+=('css-loader')

  # # PostCSS Loader
  # # PostCSS loader for webpack
  # # https://github.com/postcss/postcss-loader
  # modules+=('postcss-loader')

  # # Resolve URL Loader
  # # Webpack loader that resolves relative paths in url() statements based on the
  # # original source file
  # # https://github.com/bholloway/resolve-url-loader
  # modules+=('resolve-url-loader')

  # # Style Loader
  # # Adds CSS to the DOM by injecting a <style> tag
  # # https://github.com/webpack-contrib/style-loader
  # modules+=('style-loader')

  # ----------------------------------------------------------------------------

  # # Webpack Bundle Analyzer
  # # Visualize size of webpack output files with an interactive zoomable treemap.
  # # https://github.com/webpack-contrib/webpack-bundle-analyzer
  # modules+=('webpack-bundle-analyzer')

  # ----------------------------------------------------------------------------

  # # url-loader
  # # A loader for webpack which transforms files into base64 URIs
  # # https://github.com/webpack-contrib/url-loader
  # modules+=('url-loader')

  # ----------------------------------------------------------------------------

  # yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------







  # https://nystudio107.com/blog/an-annotated-webpack-4-config-for-frontend-web-development


  # "scripts": {
  #     "dev": "npx webpack-dev-server --config webpack.dev.js",
  #     "build": "npx webpack --config webpack.prod.js --progress --hide-modules"
  # },


  # "browserslist": {
  #     "production": [
  #         "> 1%",
  #         "last 2 versions",
  #         "Firefox ESR"
  #     ],
  #     "legacyBrowsers": [
  #         "> 1%",
  #         "last 2 versions",
  #         "Firefox ESR"
  #     ],
  #     "modernBrowsers": [
  #         "last 2 Chrome versions",
  #         "not Chrome < 60",
  #         "last 2 Safari versions",
  #         "not Safari < 10.1",
  #         "last 2 iOS versions",
  #         "not iOS < 10.3",
  #         "last 2 Firefox versions",
  #         "not Firefox < 54",
  #         "last 2 Edge versions",
  #         "not Edge < 15"
  #     ]
  # },



  # "devDependencies": {
  #       "@babel/core": "^7.1.0",
  #       "@babel/plugin-syntax-dynamic-import": "^7.0.0",
  #       "@babel/plugin-transform-runtime": "^7.1.0",
  #       "@babel/preset-env": "^7.1.0",
  #       "@babel/register": "^7.0.0",
  #       "@babel/runtime": "^7.0.0",
  #       "babel-loader": "^8.0.2",
  #       "clean-webpack-plugin": "^0.1.19",
  #       "copy-webpack-plugin": "^4.5.2",
  #       "create-symlink-webpack-plugin": "^1.0.0",
  #       "critical": "^1.3.4",
  #       "critical-css-webpack-plugin": "^0.2.0",
  #       "css-loader": "^1.0.0",
  #       "cssnano": "^4.1.0",
  #       "dotenv": "^6.1.0",
  #       "file-loader": "^2.0.0",
  #       "git-rev-sync": "^1.12.0",
  #       "glob-all": "^3.1.0",
  #       "html-webpack-plugin": "^3.2.0",
  #       "ignore-loader": "^0.1.2",
  #       "imagemin": "^6.0.0",
  #       "imagemin-gifsicle": "^5.2.0",
  #       "imagemin-mozjpeg": "^7.0.0",
  #       "imagemin-optipng": "^5.2.1",
  #       "imagemin-svgo": "^7.0.0",
  #       "imagemin-webp": "^4.1.0",
  #       "imagemin-webp-webpack-plugin": "^1.0.2",
  #       "img-loader": "^3.0.1",
  #       "mini-css-extract-plugin": "^0.4.3",
  #       "moment": "^2.22.2",
  #       "optimize-css-assets-webpack-plugin": "^5.0.1",
  #       "postcss": "^7.0.2",
  #       "postcss-import": "^12.0.0",
  #       "postcss-loader": "^3.0.0",
  #       "postcss-preset-env": "^6.4.0",
  #       "purgecss-webpack-plugin": "^1.3.0",
  #       "purgecss-whitelister": "^2.2.0",
  #       "resolve-url-loader": "^3.0.0",
  #       "sane": "^4.0.1",
  #       "save-remote-file-webpack-plugin": "^1.0.0",
  #       "style-loader": "^0.23.0",
  #       "symlink-webpack-plugin": "^0.0.4",
  #       "terser-webpack-plugin": "^1.1.0",
  #       "vue-loader": "^15.4.2",
  #       "vue-style-loader": "^4.1.2",
  #       "vue-template-compiler": "^2.5.17",
  #       "webapp-webpack-plugin": "https://github.com/brunocodutra/webapp-webpack-plugin.git",
  #       "webpack": "^4.19.1",
  #       "webpack-bundle-analyzer": "^3.0.2",
  #       "webpack-cli": "^3.1.1",
  #       "webpack-dashboard": "^2.0.0",
  #       "webpack-dev-server": "^3.1.9",
  #       "webpack-manifest-plugin": "^2.0.4",
  #       "webpack-merge": "^4.1.4",
  #       "webpack-notifier": "^1.6.0",
  #       "workbox-webpack-plugin": "^3.6.2"
  #   },


  # "dependencies": {
  #   "@babel/polyfill": "^7.0.0",
  #   "axios": "^0.18.0",
  #   "tailwindcss": "^0.6.6",
  #   "vue": "^2.5.17",
  #   "vue-confetti": "^0.4.2"
  # }


}
