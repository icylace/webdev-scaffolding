#!/usr/bin/env bash

setup_eslint() {
  local modules=()

  # ESLint
  # Checks the style of JavaScript code.
  # https://eslint.org/
  # https://www.npmjs.com/package/eslint
  modules+=('eslint')

  # eslint-plugin-import
  # ESLint plugin with rules that help validate proper imports.
  # https://github.com/benmosher/eslint-plugin-import
  # https://www.npmjs.com/package/eslint-plugin-import
  modules+=('eslint-plugin-import')

  # eslint-plugin-json
  # Lint your JSON files
  # https://github.com/azeemba/eslint-plugin-json
  # https://www.npmjs.com/package/eslint-plugin-json
  modules+=('eslint-plugin-json')

  # eslint-plugin-node
  # Additional ESLint's rules for Node.js
  # https://github.com/mysticatea/eslint-plugin-node
  # https://www.npmjs.com/package/eslint-plugin-node
  modules+=('eslint-plugin-node')

  # eslint-plugin-promise
  # Enforce best practices for JavaScript promises
  # https://github.com/xjamundx/eslint-plugin-promise
  # https://www.npmjs.com/package/eslint-plugin-promise
  modules+=('eslint-plugin-promise')

  # ----------------------------------------------------------------------------

  # eslint-config-standard
  # An ESLint Shareable Config for JavaScript Standard Style
  # https://github.com/standard/eslint-config-standard
  # https://www.npmjs.com/package/eslint-config-standard
  modules+=('eslint-config-standard')

  # # TODO:
  # # eslint-plugin-standard
  # # ESlint Rules for the Standard Linter
  # # https://github.com/standard/eslint-plugin-standard
  # # https://www.npmjs.com/package/eslint-plugin-standard
  # modules+=('eslint-plugin-standard')

  # ----------------------------------------------------------------------------

  if [[ " $* " == *' typescript '* ]] ; then
    # TypeScript ESLint
    # ✨ Monorepo for all the tooling which enables ESLint to support TypeScript
    # https://typescript-eslint.io/

    # eslint-import-resolver-typescript
    # This plugin adds TypeScript support to `eslint-plugin-import`.
    # https://github.com/alexgorbatchev/eslint-import-resolver-typescript
    # https://www.npmjs.com/package/eslint-import-resolver-typescript
    modules+=('eslint-import-resolver-typescript')

    # ESLint Plugin TypeScript
    # https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin
    # https://www.npmjs.com/package/@typescript-eslint/eslint-plugin
    modules+=('@typescript-eslint/eslint-plugin')

    # TypeScript ESLint Parser
    # An ESLint custom parser which leverages TypeScript ESTree to allow for
    # ESLint to lint TypeScript source code.
    # https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/parser
    # https://www.npmjs.com/package/@typescript-eslint/parser
    modules+=('@typescript-eslint/parser')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/eslint/.eslintignore" .
  cp "$WEBDEV_BUNDLE/eslint/.eslintrc.js" .

  # TODO:
  # npx eslint --init

  update_json '.scripts += {
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
  }' ./package.json
}
