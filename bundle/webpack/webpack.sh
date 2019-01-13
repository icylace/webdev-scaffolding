#!/usr/bin/env bash

source "$WEBDEV_BUNDLE/webpack/core/core.sh"
source "$WEBDEV_BUNDLE/webpack/setters/base/base.sh"
source "$WEBDEV_BUNDLE/webpack/setters/optimization/optimization.sh"
source "$WEBDEV_BUNDLE/webpack/setters/dev-server/dev-server.sh"
source "$WEBDEV_BUNDLE/webpack/setters/cleaning/cleaning.sh"
source "$WEBDEV_BUNDLE/webpack/setters/assets/assets.sh"
source "$WEBDEV_BUNDLE/webpack/setters/compression/compression.sh"
source "$WEBDEV_BUNDLE/webpack/setters/css/css.sh"
source "$WEBDEV_BUNDLE/webpack/setters/html/html.sh"
source "$WEBDEV_BUNDLE/webpack/setters/purescript/purescript.sh"
source "$WEBDEV_BUNDLE/webpack/setters/typescript/typescript.sh"

# $@ = Optional integrations to use.
setup_webpack() {
  setup_webpack_core
  setup_webpack_base
  setup_webpack_optimization
  setup_webpack_dev_server
  setup_webpack_cleaning
  setup_webpack_assets
  setup_webpack_compression
  setup_webpack_css
  setup_webpack_html

  if [[ " $* " == *' purescript '* ]] ; then
    setup_webpack_purescript
  fi

  if [[ " $* " == *' typescript '* ]] ; then
    setup_webpack_typescript
  fi

  mkdir ./tmp

  local tmp="$(mktemp)"
  jq '.scripts += {
    analyze: "npx webpack --profile --json > ./tmp/stats.json && npx webpack-bundle-analyzer ./tmp/stats.json",
    build: "npx webpack --mode production --progress",
    dev: "npx webpack --mode development --progress --watch",
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}


# TODO:


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
