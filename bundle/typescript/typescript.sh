#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
# $2+ = Optional TypeScript integrations to use.
setup_typescript() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  yarn add --dev typescript

  # @types/node
  # This package contains type definitions for Node.js (http://nodejs.org/).
  # https://www.npmjs.com/package/@types/node
  yarn add --dev @types/node

  # TypeScript Node
  # TypeScript execution environment and REPL for node.
  # https://github.com/TypeStrong/ts-node
  yarn add --dev ts-node

  # ----------------------------------------------------------------------------

  cp "$1/typescript/tsconfig.json" .

  local tmp="$(mktemp)"
  jq '.scripts += { typecheck: "tsc --noEmit" }' ./package.json > "$tmp" && mv "$tmp" ./package.json

  shift

  # ----------------------------------------------------------------------------

  if [[ " $* " == *"jest"* ]] ; then
    # @types/jest
    # This package contains type definitions for Jest
    # (http://facebook.github.io/jest/).
    # https://www.npmjs.com/package/@types/jest
    yarn add --dev @types/jest
  fi
}
