#!/usr/bin/env bash

setup_postcss() {
  local modules=()

  if [[ " $* " != *' vite '* ]] ; then
    # PostCSS
    # A tool for transforming CSS with JavaScript
    # https://postcss.org/
    # https://www.npmjs.com/package/postcss
    modules+=('postcss')

    # postcss-clean
    # PostCss plugin to minify your CSS with clean-css
    # https://github.com/leodido/postcss-clean
    modules+=('postcss-clean')

    # PostCSS CLI
    # CLI for postcss
    # https://github.com/postcss/postcss-cli
    # https://www.npmjs.com/package/postcss-cli
    modules+=('postcss-cli')

    # postcss-import
    # A PostCSS plugin to inline `@import` rules content.
    # https://github.com/postcss/postcss-import
    # https://www.npmjs.com/package/postcss-import
    modules+=('postcss-import')

    # postcss-modules
    # PostCSS plugin to use CSS Modules everywhere
    # https://github.com/css-modules/postcss-modules
    # https://www.npmjs.com/package/postcss-modules
    modules+=('postcss-modules')
  fi

  TODO:
  # # PostCSS Colorblind Plugin
  # # A PostCSS plugin for seeing your site as a colorblind person may.
  # # https://github.com/btholt/postcss-colorblind
  # # https://www.npmjs.com/package/postcss-colorblind
  # modules+=('postcss-colorblind')

  # PostCSS Normalize
  # PostCSS Normalize lets you use the parts of normalize.css or sanitize.css
  # that you need from your browserslist.
  # https://github.com/csstools/postcss-normalize
  modules+=('postcss-normalize')

  # PostCSS Preset Env
  # Use tomorrow’s CSS today.
  # https://preset-env.cssdb.org/
  # https://www.npmjs.com/package/postcss-preset-env
  modules+=('postcss-preset-env')

  # postcss-reporter
  # A PostCSS plugin to print messages registered by other PostCSS plugins.
  # https://github.com/postcss/postcss-reporter
  # https://www.npmjs.com/package/postcss-reporter
  modules+=('postcss-reporter')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/postcss/postcss.config.js" .

  update_json '.browserslist = "last 2 versions"' ./package.json

  if [[ " $* " != *' vite '* ]] ; then
    update_json '.scripts += {
      "build:dev:styles": "npm run output:postcss:dev && npm run dist:postcss",
      "build:prod:styles": "npm run output:postcss:prod && npm run dist:postcss",
      "dist:postcss": "cp ./output/postcss/index.css ./dist",
      "output:postcss:dev": "postcss ./src/index.css --output ./output/postcss/index.css",
      "output:postcss:prod": "postcss ./src/index.css --output ./output/postcss/index.css --env prod",
    }' ./package.json
  fi
}
