#!/usr/bin/env bash

  # ------------------------------------------------------------------------------
  #  TypeScript
  # ------------------------------------------------------------------------------

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  devModules+=('typescript')

  # @types/node
  # This package contains type definitions for Node.js (http://nodejs.org/).
  # https://www.npmjs.com/package/@types/node
  devModules+=('@types/node')

  devModules+=('@types/storybook__addon-actions')

  # @types/webpack
  # This package contains type definitions for webpack (https://github.com/webpack/webpack).
  # https://www.npmjs.com/package/@types/webpack
  devModules+=('@types/webpack')

  # TypeScript loader for webpack
  # TypeScript loader for webpack
  # https://github.com/TypeStrong/ts-loader
  devModules+=('ts-loader')

  # TypeScript Node
  # TypeScript execution environment and REPL for node.
  # https://github.com/TypeStrong/ts-node
  devModules+=('ts-node')

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  devModules+=('tslint')
