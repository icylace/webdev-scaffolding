#!/usr/bin/env bash

# $1 = Directory for the stylelint bundle.
# $2+ = Optional integrations to use.
setup_stylelint() {
  local modules=()

  # stylelint
  # A mighty, modern linter that helps you avoid errors and enforce conventions
  # in your styles.
  # https://stylelint.io/
  modules+=('stylelint')

  # stylelint-config-recommended
  # The recommended shareable config for stylelint.
  # https://github.com/stylelint/stylelint-config-recommended
  modules+=('stylelint-config-recommended')

  # stylelint-config-standard
  # The standard shareable config for stylelint
  # https://github.com/stylelint/stylelint-config-standard
  modules+=('stylelint-config-standard')

  # stylelint-csstree-validator
  # Stylelint plugin to validate CSS syntax
  # https://github.com/csstree/stylelint-validator
  modules+=('stylelint-csstree-validator')

  # stylelint-declaration-block-no-ignored-properties
  # Disallow property values that are ignored due to another property value
  # in the same rule.
  # https://github.com/kristerkari/stylelint-declaration-block-no-ignored-properties
  modules+=('stylelint-declaration-block-no-ignored-properties')

  # stylelint-declaration-strict-value
  # Specify properties for which a variable, function, keyword must be used.
  # https://github.com/AndyOGo/stylelint-declaration-strict-value
  modules+=('stylelint-declaration-strict-value')

  # stylelint-find-rules
  # Find stylelint rules that are not configured in your stylelint config.
  # https://github.com/alexilyaev/stylelint-find-rules
  modules+=('stylelint-find-rules')

  # stylelint-images
  # Check your CSS images to improve the performance and avoid common mistakes
  # (plugin pack).
  # https://github.com/ramasilveyra/stylelint-images
  modules+=('stylelint-images')

  # stylelint-no-browser-hacks
  # Stylelint plugin for stylehacks linting
  # https://github.com/Slamdunk/stylelint-no-browser-hacks
  modules+=('stylelint-no-browser-hacks')

  # stylelint-no-unsupported-browser-features
  # Disallow features that are unsupported by the browsers that you
  # are targeting
  # https://github.com/ismay/stylelint-no-unsupported-browser-features
  modules+=('stylelint-no-unsupported-browser-features')

  # stylelint-order
  # A plugin pack of order related linting rules for stylelint.
  # https://github.com/hudochenkov/stylelint-order
  modules+=('stylelint-order')

  if [[ $@ == *'prettier'* ]] ; then
    # stylelint-config-prettier
    # Turns off all rules that are unnecessary or might conflict with prettier.
    # https://github.com/prettier/stylelint-config-prettier
    modules+=('stylelint-config-prettier')
  fi

  yarn add --dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$1/.stylelintignore" .
  cp "$1/stylelint-order-properties.js" .
  cp "$1/stylelint.config.js" .

  # TODO: resolve invalid rules messages
  local tmp="$(mktemp)"
  jq '.scripts += {
    "lint:css": "npx stylelint ./src/**/*.css",
    "check:stylelint": "npx stylelint-find-rules"
  }' ./package.json > "$tmp" && mv -f "$tmp" ./package.json
}
