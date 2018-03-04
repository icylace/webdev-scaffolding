#!/usr/bin/env bash

setup_formatters() {
  local devExactModules=()

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  devExactModules+=('prettier')

  yarn add --dev --exact "${devExactModules[@]}"
}

# ------------------------------------------------------------------------------

setup_ui_dev_env() {
  local devModules=()

  # Storybook CLI
  # Adds Storybook, a UI development environment, to a project.
  # https://storybook.js.org/
  # https://www.npmjs.com/package/@storybook/cli
  devModules+=('@storybook/cli')

  # Storybook for Vue
  # Adds Vue component support to Storybook.
  # https://www.npmjs.com/package/@storybook/vue
  devModules+=('@storybook/vue')

  yarn add --dev "${devModules[@]}"
}

# ------------------------------------------------------------------------------

setup_linting() {
  local devFirstModules=()
  local devModules=()

  # commitlint
  # Lint commit messages
  # http://marionebl.github.io/commitlint/#/
  devModules+=('@commitlint/cli')

  # stylelint
  # Checks the style of CSS code.
  # http://stylelint.io/
  devModules+=('stylelint')

  # stylelint-processor-html
  # An stylelint plugin that extracts and lints styles from HTML files.
  # https://github.com/ccbikai/stylelint-processor-html
  devModules+=('stylelint-processor-html')

  # ESLint
  # Checks the style of JavaScript code.
  # http://eslint.org/
  devFirstModules+=('eslint')

  # eslint-plugin-html
  # An ESLint plugin that extracts and lints scripts from HTML files.
  # https://github.com/BenoitZugmeyer/eslint-plugin-html
  devModules+=('eslint-plugin-html')

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
}

# ------------------------------------------------------------------------------

setup_testing() {
  local devModules=()

  # Jest
  # Delightful JavaScript Testing
  # https://facebook.github.io/jest/
  devModules+=('jest')

  devModules+=('jest-vue')

  devModules+=('jest-serializer-vue')

  # JSVerify
  # JSVerify is a property-based testing library, highly inspired by QuickCheck.
  # http://jsverify.github.io/
  devModules+=('jsverify')

  yarn add --dev "${devModules[@]}"
}
