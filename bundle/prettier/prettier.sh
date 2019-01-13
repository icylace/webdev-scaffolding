#!/usr/bin/env bash

setup_prettier() {
  local modules=()

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  # https://prettier.io/docs/en/install.html
  yarn add --dev --exact prettier

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/prettier/.prettierignore" .
  cp "$WEBDEV_BUNDLE/prettier/prettier.config.js" .
}
