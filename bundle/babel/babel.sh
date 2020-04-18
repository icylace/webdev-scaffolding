#!/usr/bin/env bash

setup_babel() {
  local modules=()

  # Babel
  # Use next generation JavaScript, today.
  # https://babeljs.io/
  # https://www.npmjs.com/package/@babel/core
  modules+=('@babel/core')

  # Babel CLI
  # Babel comes with a built-in CLI which can be used to compile files from the
  # command line.
  # https://babeljs.io/docs/en/babel-cli
  # https://www.npmjs.com/package/@babel/cli
  modules+=('@babel/cli')

  # @babel/plugin-syntax-dynamic-import
  # https://babeljs.io/docs/en/babel-plugin-syntax-dynamic-import
  # https://www.npmjs.com/package/@babel/plugin-syntax-dynamic-import
  modules+=('@babel/plugin-syntax-dynamic-import')

  # @babel/plugin-transform-runtime
  # A plugin that enables the re-use of Babel's injected helper code to save on
  # codesize.
  # https://babeljs.io/docs/en/babel-plugin-transform-runtime
  # https://www.npmjs.com/package/@babel/plugin-transform-runtime
  modules+=('@babel/plugin-transform-runtime')

  # @babel/preset-env
  # @babel/preset-env is a smart preset that allows you to use the latest
  # JavaScript without needing to micromanage which syntax transforms
  # (and optionally, browser polyfills) are needed by your target
  # environment(s).
  # https://babeljs.io/docs/en/babel-preset-env
  # https://www.npmjs.com/package/@babel/preset-env
  modules+=('@babel/preset-env')

  # @babel/register
  # One of the ways you can use Babel is through the require hook. The require
  # hook will bind itself to node's require and automatically compile files on
  # the fly.
  # https://babeljs.io/docs/en/babel-register
  # https://www.npmjs.com/package/@babel/register
  modules+=('@babel/register')

  # @babel/runtime
  # @babel/runtime is a library that contain's Babel modular runtime helpers and
  # a version of regenerator-runtime.
  # https://babeljs.io/docs/en/babel-runtime
  # https://www.npmjs.com/package/@babel/runtime
  modules+=('@babel/runtime')

  if [[ " $* " == *' typescript '* ]] ; then
    # @babel/preset-typescript
    # Babel preset for TypeScript.
    # https://devblogs.microsoft.com/typescript/typescript-and-babel-7/
    # https://www.npmjs.com/package/@babel/preset-typescript
    modules+=('@babel/preset-typescript')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/babel/babel.config.js" .

  update_json '.scripts += {
    "build:js": "babel src --out-dir ./dist"
  }' ./package.json
}
