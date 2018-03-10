#!/usr/bin/env bash

setup_stylelint() {
  declare -n dev="$1"

  # stylelint
  # Checks the style of CSS code.
  # https://stylelint.io/
  dev+=('stylelint')

  # stylelint-config-recommended
  # The recommended shareable config for stylelint.
  # https://github.com/stylelint/stylelint-config-recommended
  dev+=('stylelint-config-recommended')

  # stylelint-config-standard
  # The standard shareable config for stylelint
  # https://github.com/stylelint/stylelint-config-standard
  dev+=('stylelint-config-standard')

  # stylelint-csstree-validator
  # Stylelint plugin to validate CSS syntax
  # https://github.com/csstree/stylelint-validator
  dev+=('stylelint-csstree-validator')

  # stylelint-declaration-block-no-ignored-properties
  # Disallow property values that are ignored due to another property value
  # in the same rule.
  # https://github.com/kristerkari/stylelint-declaration-block-no-ignored-properties
  dev+=('stylelint-declaration-block-no-ignored-properties')

  # stylelint-declaration-strict-value
  # Specify properties for which a variable, function, keyword must be used.
  # https://github.com/AndyOGo/stylelint-declaration-strict-value
  dev+=('stylelint-declaration-strict-value')

  # stylelint-find-rules
  # Find stylelint rules that are not configured in your stylelint config.
  # https://github.com/alexilyaev/stylelint-find-rules
  dev+=('stylelint-find-rules')

  # stylelint-images
  # A collection of rules to check images for stylelint (in a form of a plugin).
  # https://github.com/ramasilveyra/stylelint-images
  dev+=('stylelint-images')

  # stylelint-no-browser-hacks
  # Stylelint plugin for stylehacks linting
  # https://github.com/Slamdunk/stylelint-no-browser-hacks
  dev+=('stylelint-no-browser-hacks')

  # stylelint-no-unsupported-browser-features
  # Disallow features that are unsupported by the browsers that you
  # are targeting
  # https://github.com/ismay/stylelint-no-unsupported-browser-features
  dev+=('stylelint-no-unsupported-browser-features')

  # stylelint-order
  # A plugin pack of order related linting rules for stylelint.
  # https://github.com/hudochenkov/stylelint-order
  dev+=('stylelint-order')
}
