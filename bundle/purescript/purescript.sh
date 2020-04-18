#!/usr/bin/env bash

setup_purescript() {
  local modules=()

  # PureScript
  # A strongly-typed functional programming language that compiles to JavaScript
  # http://www.purescript.org/
  # https://www.npmjs.com/package/purescript
  modules+=('purescript')

  # spago
  # 🍝 PureScript package manager and build tool powered by Dhall and package-sets
  # https://github.com/purescript/spago
  # https://www.npmjs.com/package/spago
  modules+=('spago')

  # TODO:
  # # psa
  # # Error/Warning reporting frontend for the PureScript compiler
  # # https://github.com/natefaubion/purescript-psa
  # # https://www.npmjs.com/package/purescript-psa
  # modules+=('purescript-psa')

  # TODO:
  # # purty
  # # PureScript pretty-printer
  # # https://gitlab.com/joneshf/purty
  # # https://www.npmjs.com/package/purty
  # modules+=('purty')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  # Generate a default PureScript project.
  spago init

  local packages=()

  # PureScript Spec
  # PureScript Spec is a testing framework for Purescript, inspired by hspec.
  # https://github.com/purescript-spec/purescript-spec
  # https://pursuit.purescript.org/packages/purescript-spec
  packages+=('spec')

  # purescript-quickcheck
  # An implementation of QuickCheck in PureScript.
  # https://github.com/purescript/purescript-quickcheck
  # https://pursuit.purescript.org/packages/purescript-quickcheck
  packages+=('quickcheck')

  spago install "${packages[@]}"

  # ----------------------------------------------------------------------------

  if we_have save_gitignore ; then
    save_gitignore purescript
  fi

  update_json '.scripts += {
    build: "spago build",
    bundle: "spago bundle-module",
    "bundle:app": "spago bundle-app",
    docs: "spago docs",
    go: "spago run",
    live: "spago run --watch",
    repl: "spago repl",
    test: "spago test",
    watch: "spago build --watch",
  }' ./package.json
}
