#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_typescript() {
  local modules=()

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  modules+=('typescript')

  if [[ " $* " == *' node '* ]] ; then
    # @types/node
    # This package contains type definitions for Node.js (http://nodejs.org/).
    # https://www.npmjs.com/package/@types/node
    modules+=('@types/node')

    # TypeScript Node
    # TypeScript execution environment and REPL for node.
    # https://github.com/TypeStrong/ts-node
    modules+=('ts-node')
  fi

  if [[ " $* " == *' jest '* ]] ; then
    # @types/jest
    # This package contains type definitions for Jest
    # (http://facebook.github.io/jest/).
    # https://www.npmjs.com/package/@types/jest
    modules+=('@types/jest')
  fi

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/typescript/tsconfig.json" .

  local tmp="$(mktemp)"

  jq '.scripts += {
    typecheck: "npx tsc --noEmit",
    watch: "npx tsc --watch"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
