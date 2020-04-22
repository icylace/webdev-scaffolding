#!/usr/bin/env bash

# TODO:
# - migrate to ESLint
#   - https://github.com/typescript-eslint/tslint-to-eslint-config
#
# - tslint-config-prettier

# $@ = Optional integrations to use.
setup_tslint() {
  local modules=()

  # TSLint
  # An extensible linter for the TypeScript language.
  # https://palantir.github.io/tslint/
  # https://www.npmjs.com/package/tslint
  modules+=('tslint')

  # tslint-consistent-codestyle
  # The rules in this package can be used to enforce consistent code style.
  # https://github.com/ajafff/tslint-consistent-codestyle
  # https://www.npmjs.com/package/tslint-consistent-codestyle
  modules+=('tslint-consistent-codestyle')

  # tslint-divid
  # TSLint rules used in some projects at Divid.
  # https://github.com/dividab/tslint-divid
  # https://www.npmjs.com/package/tslint-divid
  modules+=('tslint-divid')

  # ESLint rules for TSLint
  # Improve your TSLint with the missing ESLint rules
  # https://github.com/buzinas/tslint-eslint-rules
  # https://www.npmjs.com/package/tslint-eslint-rules
  modules+=('tslint-eslint-rules')

  # tslint-immutable
  # TSLint rules to disable mutation in TypeScript.
  # https://github.com/jonaskello/tslint-immutable
  # https://www.npmjs.com/package/tslint-immutable
  modules+=('tslint-immutable')

  # tslint-microsoft-contrib
  # A set of TSLint rules used on some Microsoft projects.
  # https://github.com/Microsoft/tslint-microsoft-contrib
  # https://www.npmjs.com/package/tslint-microsoft-contrib
  modules+=('tslint-microsoft-contrib')

  # tslint-plugin-ikatyang
  # tslint rules for ikatyang
  # https://github.com/ikatyang/tslint-plugin-ikatyang
  # https://www.npmjs.com/package/tslint-plugin-ikatyang
  modules+=('tslint-plugin-ikatyang')

  # TypeScript TSLint Language Service Plugin
  # TypeScript language service plugin for TSLint.
  # https://github.com/Microsoft/typescript-tslint-plugin
  # https://www.npmjs.com/package/typescript-tslint-plugin
  modules+=('typescript-tslint-plugin')

  # vrsource-tslint-rules
  # A extra set of tslint rules
  # https://github.com/vrsource/vrsource-tslint-rules
  # https://www.npmjs.com/package/vrsource-tslint-rules
  modules+=('vrsource-tslint-rules')

  if [[ " $* " == *' eslint '* ]] ; then
    # ESLint Plugin TSLint
    # ESLint plugin wraps a TSLint configuration and lints the whole source using TSLint.
    # https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin-tslint
    # https://www.npmjs.com/package/@typescript-eslint/eslint-plugin-tslint
    modules+=('@typescript-eslint/eslint-plugin-tslint')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/tslint/tslint.json" .

  update_json '.compilerOptions += {
    plugins: [{ name: "typescript-tslint-plugin" }]
  }' ./tsconfig.json

  update_json '.scripts += {
    "lint:ts": "tslint --project tsconfig.json --config tslint.json",
  }' ./package.json
}
