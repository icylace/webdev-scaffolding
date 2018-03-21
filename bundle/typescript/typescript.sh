#!/usr/bin/env bash

# Parameters:
# $* - Optional TypeScript integrations to use.
#
setup_typescript() {
  local devModules=()

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  devModules+=('typescript')

  # @types/node
  # This package contains type definitions for Node.js (http://nodejs.org/).
  # https://www.npmjs.com/package/@types/node
  devModules+=('@types/node')

  # TypeScript Node
  # TypeScript execution environment and REPL for node.
  # https://github.com/TypeStrong/ts-node
  devModules+=('ts-node')

  if [[ " $* " == *"jest"* ]] ; then
    # @types/jest
    # This package contains type definitions for Jest
    # (http://facebook.github.io/jest/).
    # https://www.npmjs.com/package/@types/jest
    devModules+=('@types/jest')
  fi

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/typescript"

  cp "$here/tsconfig.json" .

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += { typecheck: "tsc --noEmit" }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
