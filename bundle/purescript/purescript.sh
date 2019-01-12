#!/usr/bin/env bash

setup_purescript() {
  local modules=()

  # Pulp
  # A build tool for PureScript.
  # https://github.com/purescript-contrib/pulp
  modules+=('pulp')

  yarn add --dev "${modules[@]}"

  # # purescript-halogen
  # # A declarative, type-safe UI library for PureScript.
  # # https://github.com/slamdata/purescript-halogen
  # psc-package install halogen

  # ----------------------------------------------------------------------------

  # Generate an example PureScript project.
  pulp --psc-package init

  local tmp="$(mktemp)"
  jq '.scripts += {
    browserify: "npx pulp --psc-package browserify",
    build: "npx pulp --psc-package build",
    craft: "npx pulp --psc-package build --optimise",
    docs: "npx pulp --psc-package docs",
    psci: "npx pulp --psc-package psci",
    repl: "npx pulp --psc-package psci",
    go: "npx pulp --psc-package run",
    serve: "npx pulp --psc-package server",
    test: "npx pulp --psc-package test"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json

  if we_have save_gitignore ; then
    save_gitignore purescript
  fi
}
