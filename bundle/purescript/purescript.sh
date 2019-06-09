#!/usr/bin/env bash

setup_purescript() {
  local modules=()

  # PureScript
  # A strongly-typed functional programming language that compiles to JavaScript
  # http://www.purescript.org/
  modules+=('purescript')

  # psa
  # Error/Warning reporting frontend for the PureScript compiler
  # https://github.com/natefaubion/purescript-psa
  modules+=('purescript-psa')

  # spago
  # 🍝 PureScript package manager and build tool powered by Dhall and package-sets
  # https://github.com/spacchetti/spago
  modules+=('spago')

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  # Generate a default PureScript project.
  spago init

  # ----------------------------------------------------------------------------

  local packages=()

  # purescript-quickcheck
  # An implementation of QuickCheck in PureScript.
  # https://pursuit.purescript.org/packages/purescript-quickcheck
  packages+=('quickcheck')

  spago install "${packages[@]}"

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    build: "npx spago build",
    bundle: "npx spago bundle-module",
    "bundle:app": "npx spago bundle-app",
    docs: "npx spago docs",
    go: "npx spago run",
    live: "npx spago run --watch",
    repl: "npx spago repl",
    test: "npx spago test",
    watch: "npx spago build --watch",
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json

  if we_have save_gitignore ; then
    save_gitignore purescript
  fi
}
