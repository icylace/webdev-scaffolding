#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_typescript() {
  local modules=()

  # TypeScript
  # A superset of JavaScript that compiles to clean JavaScript output.
  # https://www.typescriptlang.org/
  # https://www.npmjs.com/package/typescript
  modules+=('typescript')

  if [[ " $* " == *' node '* ]] ; then
    # @types/node
    # This package contains type definitions for Node.js (http://nodejs.org/).
    # https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/node
    # https://www.npmjs.com/package/@types/node
    modules+=('@types/node')

    # TypeScript Node
    # TypeScript execution environment and REPL for node.
    # https://github.com/TypeStrong/ts-node
    # https://www.npmjs.com/package/ts-node
    modules+=('ts-node')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/typescript/tsconfig.json" .

  update_json '.scripts += {
    build: "tsc --build --incremental false"
    "build:dev": "tsc --build",
    typecheck: "tsc --noEmit --incremental false",
    watch: "tsc --watch"
  }' ./package.json
}
