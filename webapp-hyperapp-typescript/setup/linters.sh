#!/usr/bin/env bash

setup_linters() {
  declare -n dev="$1"
  declare -n devFirst="$2"

  # Commitizen
  # Simple commit conventions for internet citizens.
  # https://commitizen.github.io/cz-cli/
  dev+=('commitizen')

  # commitlint
  # Lint commit messages
  # https://marionebl.github.io/commitlint/#/
  dev+=('@commitlint/cli')

  # @commitlint/prompt
  # This is the library and commitizen adapter version of commitlint prompt.
  # https://www.npmjs.com/package/@commitlint/prompt
  dev+=('@commitlint/prompt')

  # TODO: Figure out what to do about ESLint.
  # # ESLint
  # # Checks the style of JavaScript code.
  # # https://eslint.org/
  # devFirst+=('eslint')
  # "eslint-config-standard": "^11.0.0",
  # "eslint-plugin-import": "^2.9.0",
  # "eslint-plugin-node": "^6.0.1",
  # "eslint-plugin-promise": "^3.6.0",
  # "eslint-plugin-standard": "^3.0.1",

  # markdownlint
  # A Node.js style checker and lint tool for Markdown/CommonMark files.
  # https://github.com/DavidAnson/markdownlint
  dev+=('markdownlint')
  # TODO: Consider using remark-lint:
  # https://github.com/remarkjs/remark-lint
}
