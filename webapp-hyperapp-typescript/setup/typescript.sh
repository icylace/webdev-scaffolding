#!/usr/bin/env bash

setup_typescript() {
  declare -n dev="$1"

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  dev+=('typescript')

  # @types/node
  # This package contains type definitions for Node.js (http://nodejs.org/).
  # https://www.npmjs.com/package/@types/node
  dev+=('@types/node')

  # TypeScript Node
  # TypeScript execution environment and REPL for node.
  # https://github.com/TypeStrong/ts-node
  dev+=('ts-node')

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  dev+=('tslint')

  # tslint-config-prettier
  # Use tslint with prettier without any conflict
  # https://github.com/alexjoverm/tslint-config-prettier
  dev+=('tslint-config-prettier')

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  dev+=('tslint-consistent-codestyle')

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  dev+=('tslint-divid')

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  dev+=('tslint-eslint-rules')

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  dev+=('tslint-immutable')

  # misc-tslint-rules
  # Collection of miscellaneous TSLint rules
  # https://github.com/jwbay/tslint-misc-rules
  dev+=('tslint-misc-rules')

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  dev+=('tslint-microsoft-contrib')
}
