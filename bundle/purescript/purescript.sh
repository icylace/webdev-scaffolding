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
    psci: "pulp --psc-package psci",
    repl: "yarn run psci",
    go: "pulp run"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json

  save_gitignore purescript
}


# pulp browserify
# pulp build --optimise
# pulp build --optimise --to output.js
