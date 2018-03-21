#!/usr/bin/env bash

setup_stylelint() {
  local devModules=()

  # stylelint
  # Checks the style of CSS code.
  # https://stylelint.io/
  devModules+=('stylelint')

  # stylelint-config-recommended
  # The recommended shareable config for stylelint.
  # https://github.com/stylelint/stylelint-config-recommended
  devModules+=('stylelint-config-recommended')

  # stylelint-config-standard
  # The standard shareable config for stylelint
  # https://github.com/stylelint/stylelint-config-standard
  devModules+=('stylelint-config-standard')

  # stylelint-csstree-validator
  # Stylelint plugin to validate CSS syntax
  # https://github.com/csstree/stylelint-validator
  devModules+=('stylelint-csstree-validator')

  # stylelint-declaration-block-no-ignored-properties
  # Disallow property values that are ignored due to another property value
  # in the same rule.
  # https://github.com/kristerkari/stylelint-declaration-block-no-ignored-properties
  devModules+=('stylelint-declaration-block-no-ignored-properties')

  # stylelint-declaration-strict-value
  # Specify properties for which a variable, function, keyword must be used.
  # https://github.com/AndyOGo/stylelint-declaration-strict-value
  devModules+=('stylelint-declaration-strict-value')

  # stylelint-find-rules
  # Find stylelint rules that are not configured in your stylelint config.
  # https://github.com/alexilyaev/stylelint-find-rules
  devModules+=('stylelint-find-rules')

  # stylelint-images
  # A collection of rules to check images for stylelint (in a form of a plugin).
  # https://github.com/ramasilveyra/stylelint-images
  devModules+=('stylelint-images')

  # stylelint-no-browser-hacks
  # Stylelint plugin for stylehacks linting
  # https://github.com/Slamdunk/stylelint-no-browser-hacks
  devModules+=('stylelint-no-browser-hacks')

  # stylelint-no-unsupported-browser-features
  # Disallow features that are unsupported by the browsers that you
  # are targeting
  # https://github.com/ismay/stylelint-no-unsupported-browser-features
  devModules+=('stylelint-no-unsupported-browser-features')

  # stylelint-order
  # A plugin pack of order related linting rules for stylelint.
  # https://github.com/hudochenkov/stylelint-order
  devModules+=('stylelint-order')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/stylelint"

  cp "$here/.stylelintignore" .
  cp "$here/stylelint-order-properties.js" .
  cp "$here/stylelint.config.js" .

  # ----------------------------------------------------------------------------

  # TODO: resolve invalid rules messages
  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:css": "stylelint ./src/**/*.css",
    "check:stylelint": "stylelint-find-rules"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
