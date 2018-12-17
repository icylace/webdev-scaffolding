#!/usr/bin/env bash

setup_purescript() {
  # Pulp
  # A build tool for PureScript.
  # https://github.com/purescript-contrib/pulp
  yarn add --dev pulp

  # # purescript-halogen
  # # A declarative, type-safe UI library for PureScript.
  # # https://github.com/slamdata/purescript-halogen
  # psc-package install halogen

  # ----------------------------------------------------------------------------

  # Generate an example PureScript project.
  pulp --psc-package init

  local tmp="$(mktemp)"
  jq '.scripts += {
    browserify: "pulp --psc-package browserify",
    build: "pulp --psc-package build",
    craft: "pulp --psc-package build --optimise",
    docs: "pulp --psc-package docs",
    psci: "pulp --psc-package psci",
    repl: "pulp --psc-package psci",
    go: "pulp --psc-package run",
    serve: "pulp --psc-package server",
    test: "pulp --psc-package test"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json

  if we_have save_gitignore ; then
    save_gitignore purescript
  fi
}
