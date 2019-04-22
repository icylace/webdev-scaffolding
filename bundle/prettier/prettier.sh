#!/usr/bin/env bash

setup_prettier() {
  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  yarn add --dev --exact prettier

  cp "$WEBDEV_BUNDLE/prettier/.prettierignore" .
  cp "$WEBDEV_BUNDLE/prettier/prettier.config.js" .
}
