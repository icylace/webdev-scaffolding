#!/usr/bin/env bash

# $@ = Integrations to use.
setup_stryker() {
  local modules=()

  # Stryker
  # Test your tests with mutation testing.
  # https://stryker-mutator.io/
  modules+=('@stryker-mutator/core')

  if [[ " $* " == *' babel '* ]] ; then
    # Stryker Babel plugin
    # A plugin that adds support for Babel to Stryker.
    # https://www.npmjs.com/package/@stryker-mutator/babel-transpiler
    modules+=('@stryker-mutator/babel-transpiler')
  fi

  if [[ " $* " == *' javascript '* ]] ; then
    # Stryker JavaScript mutator
    # A mutator that supports JavaScript for Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/javascript-mutator
    modules+=('@stryker-mutator/javascript-mutator')
  fi

  if [[ " $* " == *' jest '* ]] ; then
    # @stryker-mutator/jest-runner
    # Stryker integration plugin for Jest.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/jest-runner
    modules+=('@stryker-mutator/jest-runner')
  fi

  if [[ " $* " == *' typescript '* ]] ; then
    # Stryker Typescript
    # A collection of plugins for native TypeScript support in Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/typescript
    modules+=('@stryker-mutator/typescript')
  fi

  if [[ " $* " == *' webpack '* ]] ; then
    # Stryker Webpack Transpiler
    # A plugin to support Webpack bundling as a transpiler in Stryker.
    # https://www.npmjs.com/package/@stryker-mutator/webpack-transpiler
    modules+=('@stryker-mutator/webpack-transpiler')
  fi

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/testers/stryker.conf.js" .

  # TODO: use this?
  # npx stryker init

  local tmp="$(mktemp)"

  jq '.scripts += {
    "test:mutants": "npx stryker run"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
