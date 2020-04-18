#!/usr/bin/env bash

# $@ = Integrations to use.
setup_stryker() {
  local modules=()

  # Stryker
  # Test your tests with mutation testing.
  # https://stryker-mutator.io/
  # https://www.npmjs.com/package/@stryker-mutator/core
  modules+=('@stryker-mutator/core')

  # Stryker Command-Line Interface
  # The command-line interface for Stryker, the JavaScript mutation testing framework
  # https://github.com/stryker-mutator/stryker-cli
  # https://www.npmjs.com/package/stryker-cli
  modules+=('stryker-cli')

  if [[ " $* " == *' babel '* ]] ; then
    # Stryker Babel plugin
    # A plugin that adds support for Babel to Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/babel-transpiler
    # https://www.npmjs.com/package/@stryker-mutator/babel-transpiler
    modules+=('@stryker-mutator/babel-transpiler')
  fi

  if [[ " $* " == *' javascript '* ]] ; then
    # Stryker JavaScript mutator
    # A mutator that supports JavaScript for Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/javascript-mutator
    # https://www.npmjs.com/package/@stryker-mutator/javascript-mutator
    modules+=('@stryker-mutator/javascript-mutator')
  fi

  if [[ " $* " == *' jest '* ]] ; then
    # @stryker-mutator/jest-runner
    # Stryker integration plugin for Jest.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/jest-runner
    # https://www.npmjs.com/package/@stryker-mutator/jest-runner
    modules+=('@stryker-mutator/jest-runner')
  fi

  if [[ " $* " == *' typescript '* ]] ; then
    # Stryker Typescript
    # A collection of plugins for native TypeScript support in Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/typescript
    # https://www.npmjs.com/package/@stryker-mutator/typescript
    modules+=('@stryker-mutator/typescript')
  fi

  if [[ " $* " == *' webpack '* ]] ; then
    # Stryker Webpack Transpiler
    # A plugin to support Webpack bundling as a transpiler in Stryker.
    # https://github.com/stryker-mutator/stryker/tree/master/packages/webpack-transpiler
    # https://www.npmjs.com/package/@stryker-mutator/webpack-transpiler
    modules+=('@stryker-mutator/webpack-transpiler')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  if [ -f ./.gitignore ] ; then
    echo >> ./.gitignore
    echo '.stryker-tmp' >> ./.gitignore
  fi

  cp "$WEBDEV_BUNDLE/stryker/stryker.conf.js" .

  # TODO: use this?
  # npx stryker init

  update_json '.scripts += {
    "test:mutants": "stryker run"
  }' ./package.json
}
