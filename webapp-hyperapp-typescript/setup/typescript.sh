#!/usr/bin/env bash

setup_typescript() {
  declare -n dev="$1"

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  dev+=('typescript')

  # @types/jest
  # This package contains type definitions for Jest
  # (http://facebook.github.io/jest/).
  # https://www.npmjs.com/package/@types/jest
  dev+=('@types/jest')

  # @types/node
  # This package contains type definitions for Node.js (http://nodejs.org/).
  # https://www.npmjs.com/package/@types/node
  dev+=('@types/node')

  # TypeScript Node
  # TypeScript execution environment and REPL for node.
  # https://github.com/TypeStrong/ts-node
  dev+=('ts-node')
}
