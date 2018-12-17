#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_stylelint() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # stylelint
  # Checks the style of CSS code.
  # https://stylelint.io/
  yarn add --dev stylelint

  # stylelint-config-recommended
  # The recommended shareable config for stylelint.
  # https://github.com/stylelint/stylelint-config-recommended
  yarn add --dev stylelint-config-recommended

  # stylelint-config-standard
  # The standard shareable config for stylelint
  # https://github.com/stylelint/stylelint-config-standard
  yarn add --dev stylelint-config-standard

  # stylelint-csstree-validator
  # Stylelint plugin to validate CSS syntax
  # https://github.com/csstree/stylelint-validator
  yarn add --dev stylelint-csstree-validator

  # stylelint-declaration-block-no-ignored-properties
  # Disallow property values that are ignored due to another property value
  # in the same rule.
  # https://github.com/kristerkari/stylelint-declaration-block-no-ignored-properties
  yarn add --dev stylelint-declaration-block-no-ignored-properties

  # stylelint-declaration-strict-value
  # Specify properties for which a variable, function, keyword must be used.
  # https://github.com/AndyOGo/stylelint-declaration-strict-value
  yarn add --dev stylelint-declaration-strict-value

  # stylelint-find-rules
  # Find stylelint rules that are not configured in your stylelint config.
  # https://github.com/alexilyaev/stylelint-find-rules
  yarn add --dev stylelint-find-rules

  # stylelint-images
  # A collection of rules to check images for stylelint (in a form of a plugin).
  # https://github.com/ramasilveyra/stylelint-images
  yarn add --dev stylelint-images

  # stylelint-no-browser-hacks
  # Stylelint plugin for stylehacks linting
  # https://github.com/Slamdunk/stylelint-no-browser-hacks
  yarn add --dev stylelint-no-browser-hacks

  # stylelint-no-unsupported-browser-features
  # Disallow features that are unsupported by the browsers that you
  # are targeting
  # https://github.com/ismay/stylelint-no-unsupported-browser-features
  yarn add --dev stylelint-no-unsupported-browser-features

  # stylelint-order
  # A plugin pack of order related linting rules for stylelint.
  # https://github.com/hudochenkov/stylelint-order
  yarn add --dev stylelint-order

  # ----------------------------------------------------------------------------

  cp "$1/stylelint/.stylelintignore" .
  cp "$1/stylelint/stylelint-order-properties.js" .
  cp "$1/stylelint/stylelint.config.js" .

  # TODO: resolve invalid rules messages
  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:css": "stylelint ./src/**/*.css",
    "check:stylelint": "stylelint-find-rules"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
