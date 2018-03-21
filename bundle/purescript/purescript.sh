#!/usr/bin/env bash

setup_purescript() {
  local devModules=()

  # PureScript
  # A strongly-typed functional programming language that compiles to JavaScript
  # http://www.purescript.org/
  devModules+=('purescript')

  # Pulp
  # A build tool for PureScript.
  # https://github.com/purescript-contrib/pulp
  devModules+=('pulp')

  # psc-package
  # A package manager for PureScript based on package sets
  # https://github.com/purescript/psc-package
  # https://github.com/joneshf/node-psc-package-bin
  devModules+=('psc-package')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  # Generate an example PureScript project.
  pulp --psc-package init

  # purescript-halogen
  # A declarative, type-safe UI library for PureScript.
  # https://github.com/slamdata/purescript-halogen
  psc-package install halogen

  # purescript-prelude
  # The PureScript Prelude
  # https://github.com/purescript/purescript-prelude
  psc-package install prelude

  # # purescript-prettier-printer
  # # An implementation of A prettier printer (Wadler 2003) in PureScript.
  # # https://github.com/paulyoung/purescript-prettier-printer
  # psc-package add-from-bower purescript-prettier-printer

  # # purescript-sdom
  # # An experiment in replacing the virtual DOM and avoiding diffing
  # # https://github.com/paf31/purescript-sdom
  # psc-package add-from-bower purescript-sdom

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += {
    psci: "pulp --psc-package psci",
    repl: "yarn run psci",
    go: "pulp run"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
